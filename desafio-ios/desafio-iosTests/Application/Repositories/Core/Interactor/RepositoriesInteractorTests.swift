//
//  RepositoriesInteractorTests.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 04/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import XCTest
@testable import desafio_ios

class RepositoriesInteractorTests: XCTestCase {
    
    private var gateway: RepositoriesStubGateway!
    private var interactor: RepositoriesInteractor!
    
    private var didCallPresentEntities = false
    private var didCallPresentWithRepositories: [Repository] = []
    private var didCallPresentError = false
    private var didCallPresentLoading = false
    private var didCallDismissLoading = false
    
    private lazy var presenter = RepositoriesPresenterFactory.make(onLoading: {
        self.didCallPresentLoading = true
    }, onSuccess: { repositories in
        self.didCallDismissLoading = true
        self.didCallPresentEntities = true
        self.didCallPresentWithRepositories = repositories
    }) { error in
        self.didCallPresentError = true
    }
    
    private var repository = Repository(name: "Som de Play", description: "É Som de Play", owner: Repository.Owner(name: "Lázaro", picture: "http://github.com"), numberStars: 50, numberForks: 50, urlPullsRequests: "http://github.com")
    
    override func setUp() {
        super.setUp()
        didCallPresentEntities = false
        didCallPresentError = false
        didCallPresentLoading = false
        didCallDismissLoading = false
        gateway = RepositoriesStubGateway()
        interactor = RepositoriesInteractor(gateway: gateway, presenter: presenter)
    }
    
    func testShouldGetRepositoriesSuccess() {
        gateway.setupCompletionHandlerResult = Result.success([repository])
        interactor.getRepositories()
        
        XCTAssertTrue(didCallPresentLoading)
        XCTAssertTrue(didCallDismissLoading)
        XCTAssertTrue(gateway.didCallRepositoriesByPage)
        XCTAssertTrue(didCallPresentEntities)
        XCTAssertFalse(didCallPresentError)
    }
    
    func testShouldGetRepositoriesSuccessButWithoutPresentation() {
        gateway.setupCompletionHandlerResult = Result.success([])
        interactor.getRepositories()
        
        XCTAssertTrue(didCallPresentLoading)
        XCTAssertTrue(didCallDismissLoading)
        XCTAssertTrue(gateway.didCallRepositoriesByPage)
        XCTAssertTrue(didCallPresentEntities)
        XCTAssertNotNil(didCallPresentWithRepositories)
        XCTAssertFalse(didCallPresentError)
    }
    
    func testShouldGetRepositoriesSuccessWithCorrectRepository() {
        gateway.setupCompletionHandlerResult = Result.success([repository])
        interactor.getRepositories()
        
        XCTAssertNotNil(didCallPresentEntities)
        XCTAssertEqual(didCallPresentWithRepositories.first?.name, repository.name)
    }

    func testShouldGetRepositoriesFail() {
        gateway.setupCompletionHandlerResult = Result.fail(NetworkError.offline)
        interactor.getRepositories()
        
        XCTAssertTrue(gateway.didCallRepositoriesByPage)
        XCTAssertTrue(didCallPresentError)
        XCTAssertFalse(didCallPresentEntities)
        XCTAssertTrue(didCallPresentLoading)
        XCTAssertFalse(didCallDismissLoading)
    }
    
}
