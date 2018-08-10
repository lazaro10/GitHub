//
//  RepositoriesStubGateway.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 04/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

@testable import desafio_ios

final class RepositoriesStubGateway: RepositoriesGateway {
    
    var didCallRepositoriesByPage = false
    var setupCompletionHandlerResult: Result<[Repository], NetworkError>!
    
    func repositories(byPage page: Int, _ completionHandler: @escaping ((Result<[Repository], NetworkError>) -> Void)) {
        didCallRepositoriesByPage = true
        completionHandler(setupCompletionHandlerResult)
    }
}

