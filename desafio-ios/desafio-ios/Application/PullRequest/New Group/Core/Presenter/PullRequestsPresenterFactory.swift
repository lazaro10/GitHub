//
//  PullRequestsPresenterFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 22/02/2018.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequestsPresenterFactory {
    
    static func make(onLoading:@escaping () -> Void, onPullRequestList:@escaping ([PullRequest]) -> Void, onQuantityPullRequest: @escaping (String) -> Void, onNetworkError: @escaping (NetworkError) -> Void) -> PullRequestsPresenter {
        return PullRequestsPresenter(onLoading: onLoading, onPullRequestList: onPullRequestList, onQuantityPullRequest: onQuantityPullRequest, onNetworkError: onNetworkError)
    
    }
    
}
