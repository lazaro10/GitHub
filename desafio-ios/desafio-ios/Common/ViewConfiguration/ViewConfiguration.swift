//
//  ViewConfiguration.swift
//  Marvel
//
//  Created by Thiago Lioy on 18/12/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import Foundation
protocol ViewConfiguration: class {
    func setupConstraints()
    func buildViewHierarchy()
    func setupViewConfiguration()
    func configureViews()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    func configureViews() {
        
    
    }
}

// Repository = https://github.com/thiagolioy/marvelapp
// Branch = view_code
