//
//  PostsRemoteDataManager.swift
//  RSReactiveRequest
//
//  Created on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift

final class PostsRemoteDataManager: PostsRemoteDataManagerProtocol {

    private let service: TypicodeServiceProtocol

    init(service: TypicodeServiceProtocol = TypicodeService()) {
        self.service = service
    }

    func getPost(postId: Int, scheduler: ImmediateSchedulerType?) -> Single<Post> {
        return service.getPost(postId: postId, scheduler: scheduler)
            .map{ Post(postDecodable: $0) }
    }

    func getPosts(scheduler: ImmediateSchedulerType?) -> Single<[Post]> {
        return service.getPosts(scheduler: scheduler)
            .map({ postDecodableList -> [Post] in
            return postDecodableList.map{ Post(postDecodable: $0) }
        })
    }
    
    func savaPost(post: Post, scheduler: ImmediateSchedulerType?) -> Single<Post> {
        return service.savePost(postEncodable: PostEncodable(post: post), scheduler: scheduler)
            .map{ Post(postDecodable: $0) }
    }
    
    func updatePost(post: Post, scheduler: ImmediateSchedulerType?) -> Single<Post> {
        return service.updatePost(postEncodable: PostEncodable(post: post), scheduler: scheduler)
            .map{ Post(postDecodable: $0) }
    }
}
