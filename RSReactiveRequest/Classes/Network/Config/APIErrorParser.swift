//
//  APIErrorParser.swift
//  medicos
//
//  Created by Renato Massi on 13/08/2018.
//  Copyright © 2018 filoo. All rights reserved.
//

import Foundation

public  class APIErrorParser: ErrorParser {

    public func parserError(from data: Data?, statusCode: Int) -> Error? {
        switch statusCode {
        case 401:
            return AppNetworkError.unauthorized
        default:
            return nil
        }
    }

}
