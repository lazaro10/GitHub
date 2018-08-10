//
//  DownloadImageNetworkFactory.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 02/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

struct DownloadImageNetworkFactory {
    static func make() -> DownloadImage {
       return DownloadImageNetwork()
    }
}
