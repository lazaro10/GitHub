//
//  FakeTableViewCell.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 04/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit
@testable import desafio_ios

class FakeTableViewCell: UITableViewCell {
    fileprivate var fakeString: String?
}

extension FakeTableViewCell: ViewCellHandler {
    typealias Item = String
    
    var data: Item? {
        get {
            return fakeString
        }
        set {
            fakeString = newValue
        }
    }
}

