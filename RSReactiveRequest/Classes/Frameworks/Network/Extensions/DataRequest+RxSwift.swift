//
//  DataRequest+RxSwift.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift
import CodableAlamofire
import Alamofire

extension DataRequest {

    // MARK: - Single
    public func asSingle(scheduler: ImmediateSchedulerType? = nil) -> Single<String> {
        return single(responseBlock: { observer in
            self.responseString(completionHandler: { response in
                RequestManager.requestReceived(response: response, observer: observer)
            })
        })
    }

    public func asSingle<T: Decodable>(scheduler: ImmediateSchedulerType? = nil) -> Single<T> {
        return single(responseBlock: { observer in
            self.responseDecodableObject(decoder: RequestManager.config.decoder, completionHandler: { (response: DataResponse<T>) in
                RequestManager.requestReceived(response: response, observer: observer)
            })
        })
    }

    // MARK: - Completable
    public func asCompletable(scheduler: ImmediateSchedulerType? = nil) -> Completable {
        let single: Single<String> = asSingle(scheduler: scheduler)
        return single.ignoreElements()
    }

    // MARK: - Private methods
    private func single<T>(scheduler: ImmediateSchedulerType? = nil, responseBlock: @escaping ( @escaping(SingleEvent<T>) -> Void ) -> Void) -> Single<T> {
        return Single.create(subscribe: { observer -> Disposable in
            responseBlock(observer)
            return Disposables.create {
                self.cancel()
            }
        })
    }

}
