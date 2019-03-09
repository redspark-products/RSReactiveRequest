//
//  RequestManagerConfig.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public class RequestManagerConfig {

    public let apiController: APIControllerProtocol
    public let errorParser: ErrorParser?
    public let logLevel: NetworkDebugManager.LogLevel
    public let decoder: JSONDecoder
    public let encoder: JSONEncoder

    public init(apiController: APIControllerProtocol = BaseAPIController(),
         errorParser: ErrorParser? = nil,
         logLevel: NetworkDebugManager.LogLevel = .all,
         decoder: JSONDecoder = JSONDecoder(),
         encoder: JSONEncoder = JSONEncoder()) {
        self.apiController = apiController
        self.errorParser = errorParser
        self.logLevel = logLevel
        self.decoder = decoder
        self.encoder = encoder
    }

}
