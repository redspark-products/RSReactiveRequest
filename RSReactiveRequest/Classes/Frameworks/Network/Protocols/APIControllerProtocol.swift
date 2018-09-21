//
//  APIControllerProtocol.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public protocol APIControllerProtocol {

    var manager: Alamofire.SessionManager { get }
    var baseURL: String { get }

}
