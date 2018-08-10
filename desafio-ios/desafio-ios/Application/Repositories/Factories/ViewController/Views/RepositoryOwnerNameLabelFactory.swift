//
//  RepositoryOwnerNameLabelFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 01/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct RepositoryOwnerNameLabelFactory {
    static func make() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.setDynamicFont()
        label.textColor = .title
        label.textAlignment = .center
        label.text = " "
        return label
    }
}
