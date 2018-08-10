//
//  UILabel+proportion.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

extension UILabel {
    func setDynamicFont() {
        self.font = UIFont(name: self.font.fontName, size: UIView.heightScaleProportion()*self.font.pointSize)!
    }
}
