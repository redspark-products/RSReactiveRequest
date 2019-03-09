//
//  Endpoint.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public struct Endpoint {

    private enum Constants {
        static let curlBracesRegexValidation = "\\{(.*?)\\}"
    }

    public let method: HTTPMethod
    public let api: ServiceApi
    public let port: ServicePort?
    public let version: ServiceVersion?
    public let pathParameters: [String: String]
    public let resource: String?
    public let baseUrl: String?

    public init(method: HTTPMethod = .get, api: ServiceApi, port: ServicePort? = nil, version: ServiceVersion? = nil, pathParameters: [String: String] = [:], resource: String? = nil, baseUrl: String? = nil) {
        self.method = method
        self.api = api
        self.port = port
        self.version = version
        self.pathParameters = pathParameters
        self.resource = resource
        self.baseUrl = baseUrl
    }

    public func makeURL(baseUrl: String) -> URL {
        let url = self.baseUrl ?? baseUrl
        var urlString = "\(url)/\(api.api)"

        if let resource = resource {
            urlString.append("/\(resource)")
        }

        if let version = version {
            urlString = urlString.replacingOccurrences(of: "{\(version.placeHolder)}", with: version.value)
        }

        if let port = port {
            urlString = urlString.replacingOccurrences(of: "{\(port.placeHolder)}", with: port.value)
        }

        pathParameters.forEach { (placeHolder, value) in
            urlString = urlString.replacingOccurrences(of: "{\(placeHolder)}", with: value)
        }

        return validateAndCreateURL(urlString: urlString)
    }

    private func validateAndCreateURL(urlString: String) -> URL {
        let keys = urlString.matches(for: Constants.curlBracesRegexValidation, in: urlString)

        guard let url = URL(string: urlString),
            keys.isEmpty else {
                fatalError("Endpoint error: \(urlString) is not a valid URL, needs to replace keys: \(keys.joined(separator: " | "))")
        }

        return url
    }

}
