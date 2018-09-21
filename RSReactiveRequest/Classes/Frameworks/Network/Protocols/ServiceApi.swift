//
//  ServiceApi.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public protocol ServiceApi {

    var api: String { get }

}

extension ServiceApi where Self: RawRepresentable, Self.RawValue == String {

    public var api: String {
        return rawValue
    }

}
