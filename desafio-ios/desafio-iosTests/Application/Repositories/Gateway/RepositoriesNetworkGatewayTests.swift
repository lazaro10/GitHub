//
//  RepositoriesNetworkGatewayTests.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import XCTest
@testable import desafio_ios

class RepositoriesNetworkGatewayTests: XCTestCase {
    
    private var gateway: RepositoriesNetworkGateway!
    private var getRequest: GetFakeRequest!
    
    private lazy var repositoryData = loadJson(fromFileName: "repositoriesJson")
    private lazy var repositoriesCodable: RepositoryCodable = JSONDecoder().decode(data: repositoryData)
    private lazy var repositories = repositoriesCodable.repositories.map({
        Repository(name: $0.name, description: $0.description, owner: Repository.Owner(name: $0.owner.name, picture: $0.owner.picture), numberStars: $0.numberStars, numberForks: $0.numberForks, urlPullsRequests: $0.urlPullsRequests)
    })
    
    override func setUp() {
        super.setUp()
        getRequest = GetFakeRequest()
        gateway = RepositoriesNetworkGateway(getRequest: getRequest)
    }
    
    func testShouldRequestSuccess() {
        
        var returnedRepositories: [Repository] = []
        getRequest.setupCompletionHandlerData = repositoryData
        
        gateway.repositories(byPage: 1) { result in
            switch result {
            case .success(let repositories):
                returnedRepositories = repositories
            default: return
            }
        }
        
        XCTAssertEqual(returnedRepositories.count, repositories.count)
        XCTAssertEqual(returnedRepositories.first?.name, repositories.first?.name)
        
    }
    
    func testShouldRequestFail() {
        
        var returnedError: NetworkError?
        getRequest.setupCompletionHandlerError = NetworkError.other(nil)
        
        gateway.repositories(byPage: 1) { result in
            switch result {
            case .fail(let error):
                returnedError = error
            default : return
            }
        }
        XCTAssertNotNil(returnedError)
        XCTAssertEqual(returnedError!.rawValue, NetworkError.other(nil).rawValue)
    }
    
    func testShouldRequestFailWithInvalidData() {
        var returnedError: NetworkError?
        getRequest.setupCompletionHandlerData = loadJson(fromFileName: "invalid")
        gateway.repositories(byPage: 1) { result in
            switch result {
            case .fail(let error):
                returnedError = error
            default: return
            }
        }
        XCTAssertNotNil(returnedError)
        XCTAssertEqual(returnedError?.rawValue, NetworkError.mapping.rawValue)
        
    }
}
