//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 05/02/2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    private let placeHolder = UIImage(named: "avatar-placeholder-dark")

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
}
