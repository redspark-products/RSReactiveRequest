//
//  Encodable+Parameters.swift
//  RSReactiveRequest
//
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

extension Collection where Element == Encodable {

    var parameters: Data? {
        let data = self.map{ $0.parameters }

        return try? JSONSerialization.data(withJSONObject: data)
    }

}
