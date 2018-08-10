//
//  RepositoriesPresenterFactory.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct RepositoriesPresenterFactory {
    static func make(onLoading:@escaping () -> Void,onSuccess:@escaping ([Repository]) -> Void, onNetworkError: @escaping (NetworkError) -> Void) -> RepositoriesPresenter {
        return RepositoriesPresenter(onLoading: onLoading, onSuccess: onSuccess, onNetworkError: onNetworkError)
    }
}
