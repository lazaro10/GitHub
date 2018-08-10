//
//  RepositoriesNetworkGatewayFactory.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct RepositoriesNetworkGatewayFactory {
    static func make() -> RepositoriesGateway {
        return RepositoriesNetworkGateway(getRequest: GetRequestFactory.make())
    }
}
