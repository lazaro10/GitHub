//
//  RepositoryDescriptionLabelFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

import UIKit

struct RepositoryDescriptionLabelFactory {
    static func make() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.setDynamicFont()
        label.textColor = .text
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = " "
        return label
    }
}
