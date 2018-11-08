//
//  UploadFileRequest+RxSwift.swift
//  RSReactiveRequest
//
//  Created by Andre M. Della Torre on 08/11/18.
//

import Foundation
import RxSwift
import Alamofire

extension UploadFileRequest {

    // MARK: - Single
    func asSingle(scheduler: ImmediateSchedulerType? = nil) -> Single<String> {
        return single(scheduler: scheduler, responseBlock: { (observer, request) in
            request.responseString(completionHandler: { response in
                RequestManager.requestReceived(response: response, observer: observer)
            })
        })
    }

    public func asSingle<T: Decodable>(scheduler: ImmediateSchedulerType? = nil) -> Single<T> {
        return single(responseBlock: { (observer, request) in
            request.responseDecodableObject(decoder: RequestManager.config.decoder, completionHandler: { (response: DataResponse<T>) in
                RequestManager.requestReceived(response: response, observer: observer)
            })
        })
    }


    // MARK: - Completable
    func asCompletable(scheduler: ImmediateSchedulerType? = nil) -> Completable {
        let single: Single<String> = asSingle(scheduler: scheduler)
        return single.ignoreElements()
    }

    // MARK: - Private Methods
    private func single<T>(scheduler: ImmediateSchedulerType? = nil, responseBlock: @escaping ( @escaping (SingleEvent<T>) -> Void, DataRequest) -> Void) -> Single<T> {
        return Single.create(subscribe: { observer -> Disposable in
            var request: DataRequest? = nil
            self.sessionManager
                .upload(multipartFormData: self.mountMultipartFormData,
                        usingThreshold: UInt64.init(),
                        to: self.url,
                        method: .post,
                        headers: self.headers,
                        encodingCompletion: { result in
                            switch result {
                            case .success(let upload, _, _):
                                request = upload.validate(statusCode: 200..<300)
                                responseBlock(observer, upload)
                            case .failure(let error):
                                observer(.error(error))
                            }
                })

            return Disposables.create {
                request?.cancel()
            }
        })
            .subscribeAndObserveOn(scheduler)
    }

    private func mountMultipartFormData(multipartFormData: MultipartFormData) {
        self.files.forEach {
            multipartFormData.append($0.data, withName: $0.name, fileName: $0.fileName, mimeType: $0.mimeType.rawValue)

            if let jsonProperties = $0.properties?.parameters {
                for (key, value) in jsonProperties {
                    let stringValue = "\(value)"
                    let data = stringValue.data(using: .utf8) ?? Data()
                    multipartFormData.append(data, withName: key)
                }
            }
        }
    }

}
