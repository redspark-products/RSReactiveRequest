//
//  PrimitiveSequenceType+IgnoreElements.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

public extension PrimitiveSequenceType {

    public func ignoreElements() -> Completable {
        return primitiveSequence.asObservable()
            .ignoreElements()
    }

}
