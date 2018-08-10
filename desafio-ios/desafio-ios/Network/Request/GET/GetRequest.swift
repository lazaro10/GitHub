//
//  GetRequest.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import UIKit

private var getRequestCache: [String: Data] = [:]

final class GetRequest: GetRequestable {
    
    
    func get(url urlString: String, completionHandler: @escaping (Data?, NetworkError?) -> Void) {
        if let cachedData = getRequestCache[urlString] {
            return completionHandler(cachedData, nil)
        }
        makeRequest(url: urlString, completionHandler: completionHandler)
    }
    
    private func makeRequest(url urlString: String, completionHandler: @escaping (Data?, NetworkError?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let fullUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: fullUrl) else { return }
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, _, error in
            
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            if let error = error as? URLError,
                error.code == .notConnectedToInternet {
                completionHandler(nil, NetworkError.offline)
                return
            }
            completionHandler(data, NetworkError.other(error))
            if let data = data {
                getRequestCache[urlString] = data
            }
        }
        
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
}
