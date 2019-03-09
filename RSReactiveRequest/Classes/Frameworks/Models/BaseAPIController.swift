//
//  BaseAPIController.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public class BaseAPIController: APIControllerProtocol {

    public let manager: SessionManager

    public init() {
        URLCache.shared.removeAllCachedResponses()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        let manager = Alamofire.SessionManager(configuration: configuration)
        self.manager = manager
    }

    public var baseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("Fail to load base url, implement BASE_URL key on info.plist and add in project settings")
        }

        return url
    }


}
