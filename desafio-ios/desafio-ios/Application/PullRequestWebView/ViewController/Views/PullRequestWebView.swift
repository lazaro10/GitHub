//
//  PullRequestWebView.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 05/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class PullRequestWebView: UIWebView, PresentationView {
    
    var loadingView: LoadingView!
    var errorView: ErrorView!
    lazy var presenter: PullRequestWebViewPresenter = PullRequestWebViewPresenterFactory.make(onSuccess: { link in
        self.loadRequest(NSURLRequest(url: URL.init(string: link)!) as URLRequest)
    }) {
        self.errorView.update(messageText: String.ViewError.pageNotFound)
    }

    init(parentView: UIView) {
        super.init(frame: .zero)
        setupView(parentView: parentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
