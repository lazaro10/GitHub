//
//  Injectable.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 03/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

protocol Injectable {
    associatedtype T
    func inject(_: T)
    func assertDependencies()
}
