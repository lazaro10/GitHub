//
//  PullRequestsGateway.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
protocol PullRequestsGateway {
    func pullRequests(byUrl url: String, _ completionHandler: @escaping CompletionHandler<[PullRequest], NetworkError>)
}

