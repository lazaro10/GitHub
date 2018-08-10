//
//  PullRequestsNetworkGatewayFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 22/02/2018.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequestsNetworkGatewayFactory {
    static func make() -> PullRequestsNetworkGateway {
        return PullRequestsNetworkGateway(getRequest: GetRequestFactory.make())
    }
}
