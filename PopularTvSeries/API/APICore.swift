//
//  APICore.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol APIProvider: AnyObject {
    func request<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void)
}

final class APICore: APIProvider {
    
    func request<T>(url: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let request = makeRequest(url: url) else { return }
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard let urlResponse = urlResponse as? HTTPURLResponse else {
                completion(.failure(AppError.generic))
                return
            }
            
            switch urlResponse.statusCode {
            case 400..<600:
                completion(.failure(AppError.generic))
            default:
                guard let data = data else { return }
                
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(AppError.generic))
                }
            }
        }.resume()
    }
    
    private func makeRequest(url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        return request
    }
    
}
