//
//  LoadingViewFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 05/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct LoadingViewFactory {
    static func make(parentView: UIView) -> LoadingView {
        return LoadingView(parentView: parentView)
    }
}

