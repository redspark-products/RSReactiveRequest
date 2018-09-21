//
//  PostsPresenter.swift
//  RSReactiveRequest
//
//  Created on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift

final class PostsPresenter: PostsPresenterProtocol {
    
    weak var view: PostsViewProtocol!
    var router: PostsRouterProtocol!
    var interactor: PostsInteractorProtocol!

    private let disposeBag = DisposeBag()

    func viewDidLoad() {
        getPosts()
        getPost(postId: 1)

        let post1 = Post(userId: 1,
                         title: "foo 1",
                         body: "bar 1")
        savaPost(post: post1)

        let post2 = Post(id: 1,
                         userId: 1,
                         title: "foo 2",
                         body: "bar 2")
        updatePost(post: post2)
    }

    private func getPost(postId: Int) {
        interactor.getPost(postId: postId)
            .subscribeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] post in
                debugPrint()
                debugPrint(#function)
                self?.view.setup(post: post)
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposeBag)
    }

    private func getPosts() {
        interactor.postsObservable
            .subscribeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] postList in
                debugPrint()
                debugPrint(#function)
                self?.view.setup(posts: postList)
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposeBag)
    }

    private func savaPost(post: Post) {
        interactor.savaPost(post: post)
            .subscribeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] post in
                debugPrint()
                debugPrint(#function)
                self?.view.setup(post: post)
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposeBag)
    }

    private func updatePost(post: Post) {
        interactor.updatePost(post: post)
            .subscribeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] post in
                debugPrint()
                debugPrint(#function)
                self?.view.setup(post: post)
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposeBag)

    }
}
