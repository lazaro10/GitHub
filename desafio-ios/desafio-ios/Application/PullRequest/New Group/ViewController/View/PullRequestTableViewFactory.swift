//
//  PullRequestTableViewFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct PullRequestTableViewFactory {
    static func make() -> UITableView {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 150
        tableView.register(PullRequestTableViewCell.self, forCellReuseIdentifier: PullRequestTableViewCell.identifier)
        return tableView
    }
}

