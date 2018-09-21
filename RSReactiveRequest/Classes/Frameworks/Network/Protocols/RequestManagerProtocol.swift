//
//  RequestManagerProtocol.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public protocol RequestManagerProtocol {

    static var config: RequestManagerConfig { get }

    func request(endpoint: Endpoint, data: Encodable?, encoding: ParameterEncoding?, headers: HTTPHeaders?) -> DataRequest

}

extension RequestManagerProtocol {

    public func request(endpoint: Endpoint, data: Encodable? = nil, encoding: ParameterEncoding? = nil, headers: HTTPHeaders? = nil) -> DataRequest {
        return request(endpoint: endpoint, data: data, encoding: encoding, headers: headers)
    }

}
