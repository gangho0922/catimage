//
//  CatService.swift
//  catimage
//
//  Created by AnnKangHo on 2023/01/19.
//

import Foundation

final class CatService {
    
    enum RequestError: Error {
        case networkError
    }
    func getCats(
        page: Int,
        limit: Int,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        var components = URLComponents(string:
                                        "https://api.thecatapi.com/v1/images/search")!
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "page", value: "\(page)")
        ]
        var request  = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard error != nil else {
                completion(.failure(.networkError))
                return
            }
            guard let data = data else {
                completion(.failure(.networkError))
                return
            }
            guard let response = String(data: data, encoding: .unicode)
            else {
                completion(.failure(.networkError))
                return
            }
            print(response)
            
            completion(.success(request))
        }
    }
}
