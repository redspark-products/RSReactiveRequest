//
//  TypicodeService.swift
//  RSReactiveRequest_Example
//
//  Created by Marcos Fonseca on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import RSReactiveRequest
import RxSwift

final class TypicodeService: TypicodeServiceProtocol {

    private enum API: String, ServiceApi {
        case posts = "posts"
    }

    private let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }

    func getPost(postId: Int, scheduler: ImmediateSchedulerType?) -> Single<PostDecodable> {
        let endpoint = Endpoint(method: .get, api: API.posts, resource: String(describing: postId))
        return requestManager.request(endpoint: endpoint).asSingle()
    }
    
    func getPosts(scheduler: ImmediateSchedulerType?) -> Single<[PostDecodable]> {
        let endpoint = Endpoint(method: .get, api: API.posts)
        return requestManager.request(endpoint: endpoint).asSingle()
    }

    func savePost(postEncodable: PostEncodable, scheduler: ImmediateSchedulerType?) -> Completable {
        let endpoint = Endpoint(method: .post, api: API.posts)
        return requestManager.request(endpoint: endpoint, data: postEncodable).asCompletable()
    }

    func updatePost(postEncodable: PostEncodable, scheduler: ImmediateSchedulerType?) -> Completable {
        let endpoint = Endpoint(method: .put, api: API.posts, resource: String(describing: postEncodable.id))
        return requestManager.request(endpoint: endpoint, data: postEncodable).asCompletable()
    }

}
