//
//  PullRequestsStubGateway.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 05/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

@testable import desafio_ios

final class PullRequestsStubGateway: PullRequestsGateway {
    
    var didCallPullRequestsByUrl = false
    var setupCompletionHandlerResult: Result<[PullRequest], NetworkError>!
    
    func pullRequests(byUrl url: String, _ completionHandler: @escaping ((Result<[PullRequest], NetworkError>) -> Void)) {
        didCallPullRequestsByUrl = true
        completionHandler(setupCompletionHandlerResult)
    }
}
