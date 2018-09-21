//
//  PostEncodable.swift
//  RSReactiveRequest_Example
//
//  Created by Marcos Fonseca on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct PostEncodable: Encodable {

    let id: Int
    let userId: Int
    let title: String
    let body: String
    let completed: Bool?

    init(post: Post) {
        id = post.id
        userId = post.userId
        title = post.title
        body = post.body
        completed = post.completed
    }
    
}
