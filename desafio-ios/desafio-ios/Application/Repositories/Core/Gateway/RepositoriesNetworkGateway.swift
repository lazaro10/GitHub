//
//  RepositoriesNetworkGateway.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct RepositoriesNetworkGateway: RepositoriesGateway {
    
    private let url = "https://api.github.com/search/repositories?q=language:Java&sort=stars&page="
    private let getRequest: GetRequestable
    
    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }
    
    func repositories(byPage page: Int, _ completionHandler: @escaping ((Result<[Repository], NetworkError>) -> Void)) {
        getRequest.get(url: "\(url)\(page)") { (data, error) in
            let result = GenerateResultObjectToArray<RepositoryCodable, Repository>(self.mapRepository).generate(data, error)
            completionHandler(result)
        }
    }
    
    private func mapRepository(entity: RepositoryCodable) -> [Repository] {
        return entity.repositories.map({
            Repository(name: $0.name, description: $0.description, owner: Repository.Owner(name: $0.owner.name, picture: $0.owner.picture), numberStars: $0.numberStars, numberForks: $0.numberForks, urlPullsRequests: $0.urlPullsRequests)
        })
    }
}
