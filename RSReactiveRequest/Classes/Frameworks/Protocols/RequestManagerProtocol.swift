//
//  RequestManagerProtocol.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public protocol RequestManagerProtocol {

    static var config: RequestManagerConfig { get }

    func request(endpoint: Endpoint, data: Encodable?, encoding: ParameterEncoding?, headers: HTTPHeaders?) -> DataRequest
    func request(endpoint: Endpoint, dataList: [Encodable], encoding: ParameterEncoding?, headers: HTTPHeaders?) -> DataRequest

}

extension RequestManagerProtocol {

    public func request(endpoint: Endpoint, data: Encodable? = nil, encoding: ParameterEncoding? = nil, headers: HTTPHeaders? = nil) -> DataRequest {
        return request(endpoint: endpoint, data: data, encoding: encoding, headers: headers)
    }

    public func request(endpoint: Endpoint, dataList: [Encodable], encoding: ParameterEncoding? = nil, headers: HTTPHeaders? = nil) -> DataRequest {
        return request(endpoint: endpoint, dataList: dataList, encoding: encoding, headers: headers)
    }

}
