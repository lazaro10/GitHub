//
//  PullRequest.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequest {
    let url: String
    let title: String
    let description: String
    let state: String
    let user: User
    
    struct User {
        let userName: String
        let picture: String
    }
}
