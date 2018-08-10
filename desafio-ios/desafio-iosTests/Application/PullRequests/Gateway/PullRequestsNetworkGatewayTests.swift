//
//  PullRequestsNetworkGatewayTests.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 05/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import XCTest
@testable import desafio_ios

class PullRequestsNetworkGatewayTests: XCTestCase {
    
    
    private var gateway: PullRequestsNetworkGateway!
    private var getRequest: GetFakeRequest!
    
    private lazy var pullRequestsData = loadJson(fromFileName: "pullRequests")
    private lazy var pullRequestCodable: [PullRequestCodable] = JSONDecoder().decode(data: pullRequestsData)
    
    private lazy var pullRequests = pullRequestCodable.map({
        PullRequest(url: $0.url ,title: $0.title, description: $0.description, state: $0.state, user: PullRequest.User(userName: $0.user.userName, picture: $0.user.picture))
    })

    override func setUp() {
        super.setUp()
        getRequest = GetFakeRequest()
        gateway = PullRequestsNetworkGateway(getRequest: getRequest)
    }
    
    func testShouldRequestSuccess() {
        var returnedPullRequests: [PullRequest] = []
        getRequest.setupCompletionHandlerData = pullRequestsData
        
        gateway.pullRequests(byUrl: "") { result in
            switch result {
            case .success(let pullRequests):
                returnedPullRequests = pullRequests
            default: return
            }
        }
        
        XCTAssertEqual(returnedPullRequests.count, pullRequests.count)
        XCTAssertEqual(returnedPullRequests.first?.title, pullRequests.first?.title)
        
    }
    
    
    func testShouldRequestFail() {
        var returnedError: NetworkError?
        getRequest.setupCompletionHandlerError = NetworkError.other(nil)
        
        gateway.pullRequests(byUrl: "") { result in
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
        gateway.pullRequests(byUrl: "") { result in
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
