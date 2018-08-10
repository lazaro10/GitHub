
//
//  PullRequestHelperViewFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct PullRequestHelperViewFactory {
    static func make() -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        return view
    }
}
