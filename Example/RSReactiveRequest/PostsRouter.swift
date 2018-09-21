//
//  PostsRouter.swift
//  RSReactiveRequest
//
//  Created on 21/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

protocol Storyboarded {

    static var storyboardName: String { get }
    static var storyboard: UIStoryboard { get }

}

extension Storyboarded {

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }

}

extension UIStoryboard {

    func instantiateViewController<T: UIViewController>() -> T {
        let identifier = String(describing: T.self)
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Failed to instantiate ViewController with identifier \(identifier)")
        }
        return viewController
    }

}


final class PostsRouter: PostsRouterProtocol, Storyboarded {
    
    static let storyboardName = "Posts"
    
    weak var viewController: UIViewController!
    
    static func assembleModule() -> UIViewController {
        let view: PostsViewController = storyboard.instantiateViewController()
        let presenter = PostsPresenter()
        let router = PostsRouter()
        let remoteDataManager = PostsRemoteDataManager()
        let interactor = PostsInteractor(remoteDataManager: remoteDataManager)
        
        view.presenter = presenter
        
        router.viewController = view
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }

}
