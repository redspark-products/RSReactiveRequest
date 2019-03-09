//
//  NetworkDebugManager.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public struct NetworkDebugManager {

    public enum LogLevel {
        case basic
        case all
        case none
    }

    public static func log<T>(_ response: DataResponse<T>) {
        guard RequestManager.config.logLevel != .none else {
            return
        }

        log(message: "==> Network Request: \(String(describing: response.request))")
        log(message: "==> Network Result: \(response.result)")
        log(message: "==> Network Error: \(String(describing: response.result.error))")

        if RequestManager.config.logLevel == .all {
            log(message: "==> Network Headers: \(String(describing: response.request?.allHTTPHeaderFields))")

            let body = String(data: response.request?.httpBody ?? Data(), encoding: .utf8)
            log(message: "==> Network Body: \(String(describing: body))")

            let responseData = String(data: response.data ?? Data(), encoding: .utf8)
            //log(message: "==> Network Response: \(String(describing: responseData))")
            log(message: "==> Network Response: \(String(describing: response.response))")
        }
    }

    private static func log(message: String) {
        print(message.replacingOccurrences(of: "\\", with: ""))
    }

}
