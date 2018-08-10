//
//  XCTestCase+LoadJson.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import XCTest

extension XCTestCase {
    func loadJson(fromFileName fileName: String) -> Data {
        let bundle = Bundle(for: RepositoryCodableTests.self)
        let filePath = bundle.path(forResource: fileName, ofType:"json")!
        return try! Data(contentsOf: URL(fileURLWithPath: filePath), options: .uncached)
    }
    
}

