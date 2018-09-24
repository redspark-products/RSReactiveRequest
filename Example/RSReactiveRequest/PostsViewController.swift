//
//  PostsViewController.swift
//  RSReactiveRequest
//
//  Created on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift

final class PostsViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let scheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated)
    private var  service: TypicodeServiceProtocol = TypicodeService()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        getPost()
        savePost()
        updatePost()
        getPosts()
    }

    func setup(post: Post) {
        debugPrint("//")
        debugPrint("id: \(post.id )")
        debugPrint("userId: \(post.userId)")
        debugPrint("title: \(post.title)")
        debugPrint("body: \(post.body)")
        debugPrint("completed: \(post.completed ?? Bool())")
        debugPrint("//")
        debugPrint()
    }

    func setup(posts: [Post]) {
        debugPrint("//")
        posts.forEach {
            debugPrint("id: \($0.id )")
            debugPrint("userId: \($0.userId)")
            debugPrint("title: \($0.title)")
            debugPrint("body: \($0.body)")
            debugPrint("completed: \($0.completed ?? Bool())")
            debugPrint("//")
            debugPrint()
        }
    }
}

extension PostsViewController {

    private func getPost() {
        fetchPost(postId: 1)
            .subscribeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] post in
                debugPrint(#function)
                self?.setup(post: post)
                debugPrint()
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposeBag)
    }

    private func getPosts() {
        fetchPosts()
            .subscribeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] postList in
                debugPrint(#function)
                self?.setup(posts: postList)
                debugPrint()
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposeBag)
    }

    private func savePost() {
        let post = Post(userId: 1,
                        title: "foo 1",
                        body: "bar 1")

        savePost(post: post)
            .subscribeOn(MainScheduler.instance)
            .subscribe(onCompleted: {
                debugPrint(#function)
                debugPrint()
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposeBag)
    }

    private func updatePost() {
        let post = Post(id: 1,
                        userId: 1,
                        title: "foo 2",
                        body: "bar 2")

        updatePost(post: post)
            .subscribeOn(MainScheduler.instance)
            .subscribe(onCompleted: {
                debugPrint(#function)
                debugPrint()
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposeBag)

    }
}

extension PostsViewController {

    func fetchPost(postId: Int) -> Single<Post> {
        return service.getPost(postId: postId, scheduler: scheduler)
            .map{ Post(postDecodable: $0) }
    }

    func fetchPosts() -> Single<[Post]> {
        return service.getPosts(scheduler: scheduler)
            .map({ postDecodableList -> [Post] in
                return postDecodableList.map{ Post(postDecodable: $0) }
            })
    }

    func savePost(post: Post) -> Completable {
        return service.savePost(postEncodable: PostEncodable(post: post), scheduler: scheduler)
    }

    func updatePost(post: Post) -> Completable {
        return service.updatePost(postEncodable: PostEncodable(post: post), scheduler: scheduler)
    }

}
