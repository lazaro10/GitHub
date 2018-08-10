//
//  PullRequestWebViewController.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 05/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class PullRequestWebViewController: UIViewController {

    private var link: String!
    var mainView: PullRequestWebView!
    
    override func viewDidLoad() {
        assertDependencies()
        mainView = PullRequestWebView(parentView: view)
        showPullRequest()
    }
    
    private func showPullRequest() {
        if !link.isEmpty {
            mainView.presenter.onSuccess(link: link)
        } else {
            mainView.presenter.onErrorView()
        }
    }
    
}

extension PullRequestWebViewController: Injectable {
    
    func inject(_ link: String) {
        self.link = link
    }
    
    func assertDependencies() {
        assert(link != nil)
    }
}
