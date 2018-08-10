//
//  Presentation.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 02/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

protocol PresentationView: class {
    var errorView: ErrorView! { get set }
    var loadingView: LoadingView! { get set }
    func presentLoading()
    func dismissLoading()
    func presentError(error: NetworkError)
    func setupView(parentView: UIView)
}

extension PresentationView where Self: UIView {
    
    func presentLoading() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = false
        }
    }
    
    func dismissLoading() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
        }
    }
    
    func presentError(error: NetworkError) {
        dismissLoading()
        errorView.update(messageText: error.localizedDescription)
        DispatchQueue.main.async {
            self.errorView.isHidden = false
        }
    }
    
    func setupView(parentView: UIView) {
        backgroundColor = .background
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let safeArea = parentView.safeAreaLayoutGuide
        topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        errorView = ErrorViewFactory.make(parentView: parentView)
        loadingView = LoadingViewFactory.make(parentView: parentView)
    }
    
}
