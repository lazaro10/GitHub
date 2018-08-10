//
//  PullRequestsViewController.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

final class PullRequestsViewController: UIViewController {
    
    private var repository: Repository!
    var mainView: PullRequestsView!
    lazy var interactor: PullRequestsInteractor = PullRequestsInteractorFactory.make(presenter: mainView.presenter)

    override func viewDidLoad() {
        assertDependencies()
        mainView = PullRequestsView(parentView: view, delegate: self)
        interactor.getPullRequests(url: repository.urlPullsRequests)
        title = repository.name
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}


extension PullRequestsViewController: PullRequestViewAction {
    
    func selectedPullRequest(link: String) {
        let pullRequestWebViewController = PullRequestWebViewController()
        pullRequestWebViewController.inject(link)
        navigationController?.pushViewController(pullRequestWebViewController, animated: true)
    }
    
}

// Poderia fazer no init, mas eu prefiro controlar pelo assert.
extension PullRequestsViewController: Injectable {
    
    func inject(_ repository: Repository) {
        self.repository = repository
    }
    
    func assertDependencies() {
        assert(repository != nil)
    }
}
