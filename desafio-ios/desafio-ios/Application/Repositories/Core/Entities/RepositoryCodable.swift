//
//  RepositoryCodable.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct RepositoryCodable: Codable {
    
    let repositories: [RepositoryCodable]
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
    
    struct RepositoryCodable: Codable {
        
        let name: String
        let description: String
        let owner: RepositoryOwnerCodable
        let numberStars: Int
        let numberForks: Int
        let urlPullsRequests: String
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case description = "description"
            case owner = "owner"
            case numberStars = "stargazers_count"
            case numberForks = "forks_count"
            case urlPullsRequests = "pulls_url"
        }
        
        struct RepositoryOwnerCodable: Codable {
            let name: String
            let picture: String
            
            enum CodingKeys: String, CodingKey {
                case name = "login"
                case picture = "avatar_url"
            }
        }
    }
}




