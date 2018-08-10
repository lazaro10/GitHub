//
//  PullRequestsWebViewPresenter.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 05/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequestWebViewPresenter {
    private let onSuccess: (String) -> Void
    private let onError: () -> Void
    
    init(onSuccess:@escaping (String) -> Void, onError: @escaping () -> Void) {
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    func onSuccess(link: String) {
        onSuccess(link)
    }
    
    func onErrorView() {
        onError()
    }
}
