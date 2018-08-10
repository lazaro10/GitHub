//
//  JSONDecoder+Decode.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(data: Data) -> T {
        return try! self.decode(T.self, from: data)
    }
}

