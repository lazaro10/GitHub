//
//  PullRequestCodableTests.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 05/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import XCTest
@testable import desafio_ios

class PullRequestCodableTests: XCTestCase {
    
    private lazy var pullRequestsData = loadJson(fromFileName: "pullRequests")
    private let firstPullRequest = PullRequest(url: "www.github.com.br", title: "2.x: Check runnable == null in *Scheduler.schedule*().", description: "", state: "", user: PullRequest.User(userName: "", picture: ""))
    
    func testShoudPullRequestCodableFromJson() {
        
        let pullRequests: [PullRequestCodable] = JSONDecoder().decode(data: pullRequestsData)
        
        XCTAssertEqual(pullRequests.first?.title, firstPullRequest.title)
        XCTAssertEqual(pullRequests.count, 1)
    }
    
}
