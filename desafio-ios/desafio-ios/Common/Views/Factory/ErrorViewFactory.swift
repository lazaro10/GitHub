//
//  ErrorViewFactory.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct ErrorViewFactory {
    static func make(parentView: UIView) -> ErrorView {
        return ErrorView(parentView: parentView)
    }
}
