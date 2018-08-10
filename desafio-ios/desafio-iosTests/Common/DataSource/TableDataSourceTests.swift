//
//  TableDataSourceTest.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 04/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import XCTest
@testable import desafio_ios

class TableDataSourceTests: XCTestCase {
    
    var dataSource: TableDataSource<FakeTableViewCell, String>!
    var tableView = UITableView(frame: .zero)
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        
        tableView.register(FakeTableViewCell.self, forCellReuseIdentifier: FakeTableViewCell.identifier)
        
        dataSource = TableDataSource(items: ["Concrete", "Accenture"])
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    func testShouldReturnNumberOfRowsInSection() {
        
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2)
    }
    
    func testShouldReturnKindOfCell() {
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell.isKind(of: FakeTableViewCell.self), "Should be FakeTableViewCell type")
    }
    
    func testShouldReturnDataOfCell() {
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! FakeTableViewCell
        
        XCTAssertEqual(cell.data, "Concrete", "Should be the first item data")
    }
    
}
