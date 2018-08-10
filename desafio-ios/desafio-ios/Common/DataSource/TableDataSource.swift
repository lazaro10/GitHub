//
//  TableDataSource.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class TableDataSource<Cell: UITableViewCell, Item>: NSObject, UITableViewDataSource where Cell: ViewCellHandler, Item == Cell.Item {
    
    let items: [Item]
    
    init(items: [Item]) {
        self.items = items
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            fatalError("Cell identifier \(Cell.identifier) not found")
        }

        cell.data = items[indexPath.row]        
        
        
        return cell
    }
    
}
