//
//  RepositoryGenericViewFactory.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 02/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct RepositoryHelpViewFactory {
    static func make() -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        return view
    }
}
