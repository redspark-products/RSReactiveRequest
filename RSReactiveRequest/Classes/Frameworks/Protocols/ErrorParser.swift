//
//  ErrorParser.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public protocol ErrorParser {

    func parserError(from data: Data?, statusCode: Int) -> Error?

}
