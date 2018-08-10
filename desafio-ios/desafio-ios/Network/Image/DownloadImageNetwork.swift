//
//  Resource.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 02/12/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

fileprivate typealias JSON = [String : Any]
fileprivate let imageCache = NSCache<NSString, UIImage>()

struct DownloadImageNetwork: DownloadImage {
    
    func download(url: URL, completion: @escaping (_ image: UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            downloadData(url: url) { data, response in
                if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    private func search(for query: String, page: Int, completion: @escaping (_ responseObject: [String : Any]?) -> Void) {
        if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL(string:"http://www.omdbapi.com/?s=\(encodedQuery)&page=\(page)") {
            downloadData(url: url) { data, response in
                
                if let data = data, let responseObject = self.convertToJSON(with: data) {
                    completion(responseObject)
                } else {
                    completion(nil)
                }
                
            }
        }
    }
    
    private func downloadData(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?) -> Void) {
        URLSession(configuration: .ephemeral).dataTask(with: URLRequest(url: url)) { data, response, _ in
            completion(data, response)
            }.resume()
    }
    
    private func convertToJSON(with data: Data) -> JSON? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON
        } catch {
            return nil
        }
    }
}

