//
//  RepositoryCodableTests.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import XCTest
@testable import desafio_ios

class RepositoryCodableTests: XCTestCase {
    private lazy var repositoriesData: Data = loadJson(fromFileName: "repositoriesJson")
    private let firstRepository = Repository.init(name: "RxJava", description: "", owner: Repository.Owner.init(name: "", picture: ""), numberStars: 0, numberForks: 0, urlPullsRequests: "")
    
    func testShoudRepositoryCodableFromJson() {
        let repositories: RepositoryCodable = JSONDecoder().decode(data: repositoriesData)
        
        XCTAssertEqual(repositories.repositories.first?.name, firstRepository.name)
        XCTAssertEqual(repositories.repositories.count, 3)
    }
}
