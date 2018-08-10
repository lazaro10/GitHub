//
//  GenerateResultArrayToArray.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

class GenerateResultArrayToArray<CodableEntity: Codable, Entity> {
    
    private let structGenerator: ([CodableEntity]) -> [Entity]
    
    init(_ structGenerator: @escaping ([CodableEntity]) -> [Entity]) {
        self.structGenerator = structGenerator
    }
    
    func generate(_ data: Data?, _ error: NetworkError?) -> Result<[Entity], NetworkError> {
        if let data = data {
            do {
                let listCodable = try JSONDecoder().decode([CodableEntity].self, from: data)
                let list = self.structGenerator(listCodable)
                return Result.success(list)
            } catch {
                return Result.fail(.mapping)
            }
        } else if let error = error {
            return Result.fail(error)
        } else {
            return Result.fail(NetworkError.other(nil))
        }
    }
    
}
