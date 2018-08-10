//
//  PullRequestViewAction.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 05/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

protocol PullRequestViewAction: class {
    func selectedPullRequest(link: String)
}
