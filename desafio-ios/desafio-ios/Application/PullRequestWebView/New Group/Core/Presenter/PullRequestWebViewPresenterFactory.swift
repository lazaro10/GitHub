//
//  PullRequestWebViewPresenterFactory.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 05/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct PullRequestWebViewPresenterFactory {
    static func make(onSuccess:@escaping (String) -> Void, onError: @escaping () -> Void) -> PullRequestWebViewPresenter {
        return  PullRequestWebViewPresenter(onSuccess: onSuccess, onError: onError)
    }
}
