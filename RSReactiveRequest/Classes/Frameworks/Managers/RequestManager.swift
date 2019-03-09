//
//  RequestManager.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

public class RequestManager: RequestManagerProtocol {

    public static var config = RequestManagerConfig()

    private let apiController: APIControllerProtocol

    public init(apiController: APIControllerProtocol = RequestManager.config.apiController) {
        self.apiController = apiController
    }

    public func request(endpoint: Endpoint, data: Encodable?, encoding: ParameterEncoding?, headers: HTTPHeaders?) -> DataRequest {
        let url = endpoint.makeURL(baseUrl: apiController.baseURL)
        let parameterEnconding = encoding ?? baseParameterEncoding(method: endpoint.method)

        return apiController.manager
            .request(url,
                     method: endpoint.method,
                     parameters: data?.parameters,
                     encoding: parameterEnconding,
                     headers: headers)
            .validate(statusCode: 200..<300)
    }

    public func request(endpoint: Endpoint, dataList: [Encodable], encoding: ParameterEncoding?, headers: HTTPHeaders?) -> DataRequest {
        let url = endpoint.makeURL(baseUrl: apiController.baseURL)

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = dataList.parameters

        return apiController.manager
            .request(request)
            .validate(statusCode: 200..<300)
    }

    public func request(endpoint: Endpoint, files: [FileRequest], encoding: ParameterEncoding?, headers: HTTPHeaders?) -> UploadFileRequest {
        let parameterEncoding = encoding ?? baseParameterEncoding(method: endpoint.method)

        let url = endpoint.makeURL(baseUrl: apiController.baseURL)

        return UploadFileRequest(sessionManager: apiController.manager, url: url, files: files, encoding: parameterEncoding, headers: headers)
    }

    private func baseParameterEncoding(method: HTTPMethod) -> ParameterEncoding {
        switch method {
        case .get,
            .delete:
            return URLEncoding(arrayEncoding: .noBrackets, boolEncoding: .literal)
        default:
            return JSONEncoding.default
        }
    }

    public static func requestReceived<T>(response: DataResponse<T>, observer: @escaping (SingleEvent<T>) -> Void) {
        NetworkDebugManager.log(response)
        switch response.result {
        case .success(let result):
            observer(.success(result))

        case .failure(let error):
            let currentError = self.getError(response: response) ?? error
            observer(.error(currentError))
        }
    }

    public static func getError<T>(response: DataResponse<T>) -> Error? {
        guard let parser = RequestManager.config.errorParser else {
            return nil
        }

        let statusCode = response.response?.statusCode ?? Int()
        return parser.parserError(from: response.data, statusCode: statusCode)
    }

}
