//
//  NetworkSetup.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public class NetworkSetup {

    private init() {
        // Instantiate only on setup function
    }

    public static func initialize() {
        let networkSetup = NetworkSetup()
        networkSetup.setupRequestManager()
    }

    private func setupRequestManager() {
        let apiController = APIController.default

        let errorParser = APIErrorParser()

        let dateFormatter = AppDateFormatter()

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(dateFormatter)

        let config = RequestManagerConfig(apiController: apiController,
                                          errorParser: errorParser,
                                          logLevel: .all,
                                          decoder: decoder,
                                          encoder: encoder)

        RequestManager.config = config
    }

}
