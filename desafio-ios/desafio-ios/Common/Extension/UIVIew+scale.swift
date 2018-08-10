//
//  UIVIew+scale.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

extension UIView {
    static func heightScaleProportion() -> CGFloat {
      return UIScreen.main.bounds.height / 667.0
    }
}
