//
//  PullRequestQuantityLabelFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct PullRequestQuantityLabelFactory {
    static func make() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.setDynamicFont()
        label.textColor = .orangeGit
        label.textAlignment = .center
        label.text = " "
        return label
    }
}
