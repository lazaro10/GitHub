//
//  RepositoriesGateway.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

protocol RepositoriesGateway {
    func repositories(byPage page: Int, _ completionHandler: @escaping CompletionHandler<[Repository], NetworkError>)
}

