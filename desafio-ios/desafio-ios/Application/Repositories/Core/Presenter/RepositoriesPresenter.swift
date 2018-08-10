//
//  RepositoriesPresenter.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

final class RepositoriesPresenter {
    
    private let onLoading: () -> Void
    private let onSuccess: ([Repository]) -> Void
    private let onNetworkError: (NetworkError) -> Void
    
    init(onLoading:@escaping () -> Void, onSuccess:@escaping ([Repository]) -> Void, onNetworkError: @escaping (NetworkError) -> Void) {
        self.onLoading = onLoading
        self.onSuccess = onSuccess
        self.onNetworkError = onNetworkError
    }
    
    func showLoading() {
        onLoading()
    }
    
    func onSuccess(repositories: [Repository]) {
        onSuccess(repositories)
    }
    
    func onNetworkError(error: NetworkError) {
        onNetworkError(error)
    }
    
}
