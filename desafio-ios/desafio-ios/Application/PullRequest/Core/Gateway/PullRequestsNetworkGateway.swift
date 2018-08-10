//
//  PullRequestsNetworkGateway.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequestsNetworkGateway: PullRequestsGateway {
    
    private let getRequest: GetRequestable
    
    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }
    
    func pullRequests(byUrl url: String, _ completionHandler: @escaping ((Result<[PullRequest], NetworkError>) -> Void)) {
        getRequest.get(url: url) { (data, error) in
            let result = GenerateResultArrayToArray<PullRequestCodable, PullRequest>(self.mapPulRequest).generate(data, error)
            completionHandler(result)
        }
    }
    
    private func mapPulRequest(entities: [PullRequestCodable]) -> [PullRequest] {
        return entities.map {
            PullRequest(url: $0.url, title: $0.title, description: $0.description, state: $0.state, user: PullRequest.User(userName: $0.user.userName, picture: $0.user.picture))
        }
    }
}
