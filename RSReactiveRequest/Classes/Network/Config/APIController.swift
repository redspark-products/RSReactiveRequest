//
//  APIController.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public  class APIController: APIControllerProtocol {

    public static let `default` = APIController()
    public let manager: SessionManager

    private init() {
        URLCache.shared.removeAllCachedResponses()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.adapter = APIRequestAdapter()
        self.manager = manager
    }

    public var baseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("Fail to load base url, implement BASE_URL key on info.plist and add in project settings")
        }

        return url
    }

}
