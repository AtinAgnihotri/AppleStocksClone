//
//  WebService.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

class WebService {
    
    private let BASE_URL = "https://island-bramble.glitch.me"
    
    private var STOCKS_URL: URL {
        guard let url = URL(string: "\(BASE_URL)/stocks") else {
            fatalError("Cannot get the URL for Stocks Endpoint")
        }
        return url
    }
    
    private var TOP_NEWS_URL: URL {
        guard let url = URL(string: "\(BASE_URL)/top-news") else {
            fatalError("Cannot get the URL for Top News Endpoint")
        }
        return url
    }
    
    func getStocks(completion: @escaping (Result<[Stock]?, NetworkError>) -> Void) {
        load(for: STOCKS_URL, completion: completion)
    }
    
    func getTopNews(completion: @escaping (Result<[NewsArticle]?, NetworkError>) -> Void) {
        load(for: TOP_NEWS_URL, completion: completion)
    }
    
    private func load<T: Decodable>(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.urlError))
                return
            }
            
            if let data = data {
                if let decoded = try? JSONDecoder().decode(T.self, from: data) {
                    DispatchQueue.main.async {
                        completion(.success(decoded))
                    }
                } else {
                    completion(.failure(.decodingError))
                }
            } else {
                completion(.failure(.domainError))
            }
            
        }.resume()
    }
}
