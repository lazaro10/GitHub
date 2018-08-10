//
//  RootNavigationViewControllerFactory.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import UIKit

struct RootNavigationViewControllerFactory {
    static func make(window: UIWindow) -> RepositoriesRouter {
        return RepositoriesNavigationRouter(window: window)
    }
}

