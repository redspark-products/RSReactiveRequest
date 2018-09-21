//
//  Post.swift
//  RSReactiveRequest_Example
//
//  Created by Marcos Fonseca on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct Post {

    let id: Int
    let userId: Int
    let title: String
    let body: String
    let completed: Bool?

    init(id: Int = 0,
         userId: Int,
         title: String,
         body: String,
         completed: Bool = false) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
        self.completed = completed
    }

    init(postDecodable: PostDecodable) {
        id = postDecodable.id
        userId = postDecodable.userId
        title = postDecodable.title
        body = postDecodable.body
        completed = postDecodable.completed
    }
    
}
