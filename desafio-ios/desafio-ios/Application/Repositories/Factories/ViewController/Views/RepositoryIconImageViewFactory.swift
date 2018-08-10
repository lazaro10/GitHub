//
//  RepositoryIconImageViewFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 01/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct RepositoryIconImageViewFactory {
    static func make(imageName: String) -> UIImageView {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: imageName)
        image.image = image.image!.withRenderingMode(.alwaysTemplate)
        image.tintColor = .orangeGit
        image.contentMode = .scaleAspectFit
        return image
    }
}
