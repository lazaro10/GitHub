//
//  PullRequestCodable.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequestCodable: Codable {
    let url: String
    let title: String
    let description: String
    let state: String
    let user: UserCodable
    
    enum CodingKeys: String, CodingKey {
        case url = "html_url"
        case title = "title"
        case description = "body"
        case state = "state"
        case user = "user"
    }
    
    struct UserCodable: Codable {
        let userName: String
        let picture: String
        
        enum CodingKeys: String, CodingKey {
            case userName = "login"
            case picture = "avatar_url"
        }
        
    }
}
