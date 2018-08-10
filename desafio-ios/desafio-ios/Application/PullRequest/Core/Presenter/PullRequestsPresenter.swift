//
//  PullRequestsPresenter.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

final class PullRequestsPresenter {
    private let onLoading: () -> Void
    private let onPullRequestList: ([PullRequest]) -> Void
    private let onQuantityPullRequest: (String) -> Void
    private let onNetworkError: (NetworkError) -> Void
    
    init(onLoading:@escaping () -> Void, onPullRequestList:@escaping ([PullRequest]) -> Void, onQuantityPullRequest: @escaping (String) -> Void, onNetworkError: @escaping (NetworkError) -> Void) {
        self.onLoading = onLoading
        self.onPullRequestList = onPullRequestList
        self.onQuantityPullRequest = onQuantityPullRequest
        self.onNetworkError = onNetworkError
    }
    
    func showLoading() {
        onLoading()
    }
    
    func onPullRequestList(pullRequest: [PullRequest]) {
        onPullRequestList(pullRequest)
    }
    
    func onQuantityPullRequest(openAndClosed: String) {
        onQuantityPullRequest(openAndClosed)
    }
    
    func onNetworkError(error: NetworkError) {
        onNetworkError(error)
    }
}


