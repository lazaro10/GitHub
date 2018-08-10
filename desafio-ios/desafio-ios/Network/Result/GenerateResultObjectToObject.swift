//
//  GenerateResultObjectToObject.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 01/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

class GenerateResultObjectToObject<CodableEntity: Codable, Entity> {
    
    private let structGenerator: (CodableEntity) -> Entity
    
    init(_ structGenerator: @escaping (CodableEntity) -> Entity) {
        self.structGenerator = structGenerator
    }
    
    func generate(_ data: Data?, _ error: NetworkError?) -> Result<Entity, NetworkError> {
        if let data = data {
            do {
                let entityCodable = try JSONDecoder().decode(CodableEntity.self, from: data)
                let entity = self.structGenerator(entityCodable)
                return Result.success(entity)
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
