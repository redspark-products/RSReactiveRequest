//
//  PostsInteractor.swift
//  RSReactiveRequest
//
//  Created on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift

final class PostsInteractor: PostsInteractorProtocol {
    
    private let remoteDataManager: PostsRemoteDataManagerProtocol
    private let scheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated)
    
    init(remoteDataManager: PostsRemoteDataManagerProtocol) {
        self.remoteDataManager = remoteDataManager
    }

    var postsObservable: Single<[Post]> {
        return remoteDataManager.getPosts(scheduler: scheduler)
    }
    
    func getPost(postId: Int) -> Single<Post> {
        return remoteDataManager.getPost(postId: postId, scheduler: scheduler)
    }

    func savaPost(post: Post) -> Single<Post> {
        return remoteDataManager.savaPost(post: post, scheduler: scheduler)
    }
    
    func updatePost(post: Post) -> Single<Post> {
        return remoteDataManager.updatePost(post: post, scheduler: scheduler)
    }

}
