//
//  NetworkService.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    
    private let allPostsURLString = "https://scripts.qexsystems.ru/test_ios/public/api/posts"
    
    private init() {}
    
    func getPosts(completion: @escaping (Result<ResponseModel, Error>) -> Void) {
        guard let url = URL(string: allPostsURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let responseStatus = response as? HTTPURLResponse,
                  responseStatus.statusCode == 200
            else { return }
            
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let apiResponse = try decoder.decode(ResponseModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(apiResponse))
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
