//
//  PostsViewController.swift
//  RSReactiveRequest
//
//  Created on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

final class PostsViewController: UIViewController {
    
    var presenter: PostsPresenterProtocol!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

// MARK: - PostsViewProtocol
extension PostsViewController: PostsViewProtocol {

    func setup(post: Post) {
        debugPrint("//")
        debugPrint("id: \(post.id ?? Int())")
        debugPrint("userId: \(post.userId)")
        debugPrint("title: \(post.title)")
        debugPrint("body: \(post.body)")
        debugPrint("completed: \(post.completed ?? Bool())")
        debugPrint("//")
    }
    
    func setup(posts: [Post]) {
        debugPrint("//")
        posts.forEach {
            debugPrint("id: \($0.id ?? Int())")
            debugPrint("userId: \($0.userId)")
            debugPrint("title: \($0.title)")
            debugPrint("body: \($0.body)")
            debugPrint("completed: \($0.completed ?? Bool())")
            debugPrint("//")
        }
    }

}
