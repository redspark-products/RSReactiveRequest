//
//  CredentialsManager.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public protocol CredentialsManager: class {

    var jwtAccessToken: String? { get set }

}
