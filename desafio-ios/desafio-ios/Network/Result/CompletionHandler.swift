//
//  CompletionHandler.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

typealias CompletionHandler<T, E: Error> = ((Result<T, E>) -> Void)

