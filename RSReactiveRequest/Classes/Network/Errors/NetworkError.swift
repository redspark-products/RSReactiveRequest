//
//  NetworkError.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public enum NetworkError: Error {

    case requestFailure
    case objectParser
    case unauthorized
    
}
