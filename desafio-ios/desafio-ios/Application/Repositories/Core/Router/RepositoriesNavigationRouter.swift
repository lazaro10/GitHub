//
//  RepositoriesNavigationRouter.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import UIKit

final class RepositoriesNavigationRouter: RepositoriesRouter {
    
    private let window: UIWindow
    private weak var repositoriesViewController: RepositoriesViewController?
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        repositoriesViewController = RepositoriesViewControllerFactory.make()
        navigationController = UINavigationController(rootViewController: self.repositoriesViewController!)
    }
    
    func root() {
        repositoriesViewController?.repositoriesRouter = self
        navigationController.navigationBar.barTintColor = .navigation
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.barStyle = .black
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showPullRequest(with repository: Repository) {
        let pullRequestsViewController = PullRequestsViewController()
        pullRequestsViewController.inject(repository)
        navigationController.pushViewController(pullRequestsViewController, animated: true)
    }
    
}
