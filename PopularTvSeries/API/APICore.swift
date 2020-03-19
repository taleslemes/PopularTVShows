//
//  APICore.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol APIProvider: AnyObject {
    func request<T>(url: String, success: @escaping (T) -> Void, failure: @escaping (Error) -> Void) where T : Decodable
}

final class APICore: APIProvider {
    
    func request<T>(url: String, success: @escaping (T) -> Void, failure: @escaping (Error) -> Void) where T : Decodable {
        guard let request = makeRequest(url: url) else { return }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                failure(AppError.generic)
                return
            }
            
            switch response.statusCode {
            case 400..<600:
                failure(AppError.generic)
            default:
                guard let data = data else { return }
                
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    success(object)
                } catch {
                    failure(AppError.generic)
                }
            }
        }.resume()
    }
    
    private func makeRequest(url: String) -> URLRequest? {
        let currentUrl = url
        guard let `url` = URL(string: currentUrl) else { return nil }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        return request
    }
    
}
