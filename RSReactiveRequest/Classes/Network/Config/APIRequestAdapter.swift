//
//  APIRequestAdapter.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public  class APIRequestAdapter: RequestAdapter {

    private enum Constants {
        static let authorizationHeader = "Authorization"
    }

    private let credentialsManager: CredentialsManager

    init(credentialsManager: CredentialsManager = UserCredentialsManager()) {
        self.credentialsManager = credentialsManager
    }

    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var request = urlRequest

        if let jwtToken = credentialsManager.jwtAccessToken {
            request.setValue(jwtToken, forHTTPHeaderField: Constants.authorizationHeader)
        }

        return request
    }

}
