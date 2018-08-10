//
//  GetFakeRequest.swift
//  desafio-iosTests
//
//  Created by Lázaro Lima dos Santos on 05/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
@testable import desafio_ios

class GetFakeRequest: GetRequestable {
    
    var setupCompletionHandlerData: Data?
    var setupCompletionHandlerError: NetworkError?
    
    func get(url: String, completionHandler: @escaping (Data?, NetworkError?) -> Void) {
        completionHandler(setupCompletionHandlerData, setupCompletionHandlerError)
    }
    
}


