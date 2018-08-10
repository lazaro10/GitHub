//
//  RepositoriesInteractor.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

fileprivate var currentPage: Int = 0
struct RepositoriesInteractor {
    
    private let gateway: RepositoriesGateway
    private(set) var presenter: RepositoriesPresenter
    
    
    init(gateway: RepositoriesGateway, presenter: RepositoriesPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func getRepositories() {
        self.presenter.showLoading()
        currentPage = currentPage + 1
        gateway.repositories(byPage: currentPage) { result in
            switch result {
            case .success(let repositories):
                self.presenter.onSuccess(repositories: repositories)
            case .fail(let error):
                self.presenter.onNetworkError(error: error)
            }
        }
    }
    
}
