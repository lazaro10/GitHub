//
//  RepositoryOwnerPictureImageViewFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 01/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct RepositoryOwnerPictureImageViewFactory {
    static func make() -> UIImageView {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "owner")
        image.layer.borderWidth = 1
        image.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }
}
