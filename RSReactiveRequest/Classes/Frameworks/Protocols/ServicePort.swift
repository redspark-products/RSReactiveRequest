//
//  ServicePort.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public protocol ServicePort {

    var value: String { get }
    var placeHolder: String { get }

}

extension ServicePort {

    public var placeHolder: String {
        return "port"
    }

}

extension ServicePort where Self: RawRepresentable, Self.RawValue == Int {

    public var value: String {
        return "\(rawValue)"
    }

}

