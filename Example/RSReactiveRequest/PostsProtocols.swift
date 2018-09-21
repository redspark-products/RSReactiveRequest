//
//  PostsProtocols.swift
//  RSReactiveRequest
//
//  Created on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

// MARK: - Interactor
protocol PostsInteractorProtocol: class {

    var postsObservable: Single<[Post]> { get }
    
    func getPost(postId: Int) -> Single<Post>
    func savaPost(post: Post) -> Single<Post>
    func updatePost(post: Post) -> Single<Post>

}

// MARK: - DataManager
protocol PostsRemoteDataManagerProtocol: class {

    func getPost(postId: Int, scheduler: ImmediateSchedulerType?) -> Single<Post>
    func getPosts(scheduler: ImmediateSchedulerType?) -> Single<[Post]>
    func savaPost(post: Post, scheduler: ImmediateSchedulerType?) -> Single<Post>
    func updatePost(post: Post, scheduler: ImmediateSchedulerType?) -> Single<Post>

}

// MARK: - Presenter
protocol PostsPresenterProtocol: class {
    
    var view: PostsViewProtocol! { get set }
    var router: PostsRouterProtocol! { get set }
    var interactor: PostsInteractorProtocol! { get set }

    func viewDidLoad()
    
}

// MARK: - View
protocol PostsViewProtocol: class {
    
    var presenter: PostsPresenterProtocol! { get set }

    func setup(post: Post)
    func setup(posts: [Post])
    
}

// MARK: - Router
protocol PostsRouterProtocol: class {
    
    var viewController: UIViewController! { get set }
    
}


