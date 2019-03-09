//
//  ServiceVersion.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public protocol ServiceVersion {

    var value: String { get }
    var placeHolder: String { get }

}

extension ServiceVersion {

    public var placeHolder: String {
        return "version"
    }

}

extension ServiceVersion where Self: RawRepresentable, Self.RawValue == String {

    public var value: String {
        return rawValue
    }

}
