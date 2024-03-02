//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 05/02/2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    private var placeHolder = UIImage(named: "avatar-placeholder-dark")
    private let cache = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolder
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard
                let self,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data,
                let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async { self.image = image }
        }
        task.resume()
    }
}
