//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 30/01/2024.
//

import UIKit


class NetworkManager {
    
    static var shared = NetworkManager()
    
    private init() {}
    
    private let baseURL = "https://api.github.com/users/"
    
    let cache = NSCache<NSString, UIImage>()
    
    ///📌 Get Array of Followers ( logo and Image url))
    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void ) {
        
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
