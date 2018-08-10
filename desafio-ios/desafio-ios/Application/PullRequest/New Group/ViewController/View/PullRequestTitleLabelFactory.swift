//
//  PullRequestTitleLabelFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct PullRequestTitleLabelFactory {
    static func make() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.setDynamicFont()
        label.textColor = .title
        label.textAlignment = .left
        label.text = " "
        return label
    }
}

