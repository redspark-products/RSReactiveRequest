//
//  PrimitiveSequenceType+IgnoreElements.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

extension PrimitiveSequenceType {

    public func ignoreElements() -> Completable {
        return primitiveSequence.asObservable()
            .ignoreElements()
    }

}
