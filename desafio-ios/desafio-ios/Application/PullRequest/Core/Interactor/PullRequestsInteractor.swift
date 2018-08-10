//
//  PullRequestsInteractor.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequestsInteractor {
    
    private let gateway: PullRequestsGateway
    private(set) var presenter: PullRequestsPresenter
    
    init(gateway: PullRequestsGateway, presenter: PullRequestsPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func getPullRequests(url: String) {
        presenter.showLoading()
        gateway.pullRequests(byUrl: configureUrlFromPulls(url: url)) { result in
            switch result {
            case .success(let pullRequests):
                self.presenter.onPullRequestList(pullRequest: pullRequests)
                self.configureOpenAndClosedQuantityPullRequests(pullRequests: pullRequests)
            case .fail(let error):
                self.presenter.onNetworkError(error: error)
            }
        }
    }
    
    private func configureOpenAndClosedQuantityPullRequests(pullRequests: [PullRequest]) {
        let open = pullRequests.filter { pullRequest in pullRequest.state == "open" }.count
        let closed = pullRequests.filter { pullRequest in pullRequest.state == "closed" }.count
        
        self.presenter.onQuantityPullRequest(openAndClosed: fomattedOpenAndClosedQuantityPullRequests(open: open, closed: closed))
    }
    
    private func fomattedOpenAndClosedQuantityPullRequests(open: Int, closed: Int) -> String {
        return "\(open) opened / \(closed) closed"
    }
    
    func configureUrlFromPulls(url: String?) -> String {
        guard var newUrl = url else { return "" }
        if let range = newUrl.range(of: "{/number}") {
            newUrl.removeSubrange(range)
        }
        return newUrl
    }
}

