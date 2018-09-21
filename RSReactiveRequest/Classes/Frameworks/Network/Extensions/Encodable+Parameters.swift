//
//  Encodable+Parameters.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

extension Encodable {

    public var parameters: Parameters? {
        guard let data = try? RequestManager.config.encoder.encode(self) else {
            return nil
        }

        let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return jsonData.flatMap{ $0 as? Parameters }
    }

}
