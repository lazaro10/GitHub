//
//  Repository.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct Repository {
    let name: String
    let description: String
    let owner: Owner
    let numberStars: Int
    let numberForks: Int
    let urlPullsRequests: String
    
    struct Owner {
        let name: String
        let picture: String
    }
    
}


