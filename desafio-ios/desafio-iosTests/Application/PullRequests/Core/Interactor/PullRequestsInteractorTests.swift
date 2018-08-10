//
//  PullRequestsInteractorTests.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 05/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import XCTest
@testable import desafio_ios

class PullRequestsInteractorTests: XCTestCase {

    
    private var gateway: PullRequestsStubGateway!
    private var interactor: PullRequestsInteractor!

    private var didCallPresentEntities = false
    private var didCallConfigureUrlFromPulls = false
    private var didCallPresentWithPullRequests: [PullRequest] = []
    private var didCallConfigureOpenAndClosedQuantityPullRequests = false
    private var didCallFomattedOpenAndClosedQuantityPullRequests = false
    private var didCallPresentWithQuantityOpenClosed: String = ""
    private var didCallPresentError = false
    private var didCallOnLoading = false
    private var didCallDismissLoading = false
    
    private lazy var presenter = PullRequestsPresenterFactory.make(onLoading: {
        self.didCallOnLoading = true
    }, onPullRequestList: { pullRequests in
        self.didCallDismissLoading = true
        self.didCallPresentEntities = true
        self.didCallConfigureUrlFromPulls = true
        self.didCallPresentWithPullRequests = pullRequests
    }, onQuantityPullRequest: { quantityPullRequest in
        self.didCallDismissLoading = true
        self.didCallConfigureOpenAndClosedQuantityPullRequests = true
        self.didCallFomattedOpenAndClosedQuantityPullRequests = true
        self.didCallPresentWithQuantityOpenClosed = quantityPullRequest
    }) { error in
        self.didCallPresentError = true
    }
    
    private var pullRequest = PullRequest(url: "www.github.com.br", title: "2.x: Check runnable == null in *Scheduler.schedule*().", description: "To enforce `@NotNull` guarantee for the PR #5734, see  https://github.com/ReactiveX/RxJava/pull/5734/files#r153951238", state: "closed", user: PullRequest.User.init(userName: "Artorias", picture: "http://github.com"))
 
    override func setUp() {
        super.setUp()
        didCallPresentEntities = false
        didCallConfigureUrlFromPulls = false
        didCallConfigureOpenAndClosedQuantityPullRequests = false
        didCallFomattedOpenAndClosedQuantityPullRequests = false
        didCallPresentError = false
        didCallOnLoading = false
        didCallDismissLoading =  false
        gateway = PullRequestsStubGateway()
        interactor = PullRequestsInteractor(gateway: gateway, presenter: presenter)
    }
    
    func testShouldUrlFromPullsCorrect() {
        let urlFormatted = interactor.configureUrlFromPulls(url: "https://api.github.com/repos/iluwatar/java-design-patterns/pulls{/number}")
        
        XCTAssertEqual(urlFormatted, "https://api.github.com/repos/iluwatar/java-design-patterns/pulls")
    }
    
    func testShouldGetPullRequestsSuccess() {
        gateway.setupCompletionHandlerResult = Result.success([pullRequest])
        interactor.getPullRequests(url: "")
        
        XCTAssertTrue(didCallOnLoading)
        XCTAssertTrue(didCallDismissLoading)
        XCTAssertTrue(gateway.didCallPullRequestsByUrl)
        XCTAssertTrue(didCallPresentEntities)
        XCTAssertTrue(didCallConfigureUrlFromPulls)
        XCTAssertTrue(didCallConfigureOpenAndClosedQuantityPullRequests)
        XCTAssertTrue(didCallFomattedOpenAndClosedQuantityPullRequests)
        XCTAssertFalse(didCallPresentError)
    }
    
    func testShouldGetPullRequestsSuccessWithoutPresentation() {
        gateway.setupCompletionHandlerResult = Result.success([])
        interactor.getPullRequests(url: "")
        
        XCTAssertTrue(didCallOnLoading)
        XCTAssertTrue(didCallDismissLoading)
        XCTAssertTrue(gateway.didCallPullRequestsByUrl)
        XCTAssertTrue(didCallPresentEntities)
        XCTAssertNotNil(didCallPresentWithPullRequests)
        XCTAssertFalse(didCallPresentError)
    }
    
    func testShouldGetPullRequestsSuccessWithCorrectRepository() {
        gateway.setupCompletionHandlerResult = Result.success([pullRequest])
        interactor.getPullRequests(url: "")
        
        XCTAssertNotNil(didCallPresentEntities)
        XCTAssertEqual(didCallPresentWithPullRequests.first?.title, pullRequest.title)
    }
    
    func testShouldGetPullRequestSuccessWithCorretOpenAndClosedQuantityFormatted() {
        gateway.setupCompletionHandlerResult = Result.success([])
        interactor.getPullRequests(url: "")
        
        XCTAssertTrue(gateway.didCallPullRequestsByUrl)
        XCTAssertEqual(didCallPresentWithQuantityOpenClosed, "0 opened / 0 closed")
    }
    
    func testShouldGetPullRequestsFail() {
        gateway.setupCompletionHandlerResult = Result.fail(NetworkError.offline)
         interactor.getPullRequests(url: "")
        
        XCTAssertTrue(didCallOnLoading)
        XCTAssertFalse(didCallDismissLoading)
        XCTAssertTrue(gateway.didCallPullRequestsByUrl)
        XCTAssertTrue(didCallPresentError)
        XCTAssertFalse(didCallPresentEntities)
    }
    
}
