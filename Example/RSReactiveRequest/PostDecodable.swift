//
//  PostEncodable.swift
//  RSReactiveRequest_Example
//
//  Created by Marcos Fonseca on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct PostDecodable: Decodable {

    let id: Int
    let userId: Int
    let title: String
    let body: String
    let completed: Bool?

}
