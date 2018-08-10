//
//  PullRequestsInteractorFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 22/02/2018.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequestsInteractorFactory {
    static func make(presenter: PullRequestsPresenter) -> PullRequestsInteractor {
        return PullRequestsInteractor(gateway: PullRequestsNetworkGatewayFactory.make(), presenter: presenter)
    }
}
