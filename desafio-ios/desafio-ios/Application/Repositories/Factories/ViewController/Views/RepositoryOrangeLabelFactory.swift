//
//  RepositoryOrangeLabelFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 01/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct RepositoryOrangeLabelFactory {
    static func make() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.setDynamicFont()
        label.textColor = .orangeGit
        label.textAlignment = .left
        label.text = " "
        return label
    }
}
