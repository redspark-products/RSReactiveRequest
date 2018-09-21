//
//  TypicodeServiceProtocol.swift
//  RSReactiveRequest_Example
//
//  Created by Marcos Fonseca on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift

protocol TypicodeServiceProtocol: class {

    func getPost(postId: Int, scheduler: ImmediateSchedulerType?) -> Single<PostDecodable>
    func getPosts(scheduler: ImmediateSchedulerType?) -> Single<[PostDecodable]>
    func savePost(postEncodable: PostEncodable, scheduler: ImmediateSchedulerType?) -> Single<PostDecodable>
    func updatePost(postEncodable: PostEncodable, scheduler: ImmediateSchedulerType?) -> Single<PostDecodable>

}
