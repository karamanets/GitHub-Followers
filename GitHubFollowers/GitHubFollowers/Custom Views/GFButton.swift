//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 11/01/2024.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Custom init to make background an title
    init(background: UIColor, title: String) {
        super.init(frame: .zero) /// use AL
        self.backgroundColor = background
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        setTitleColor(.white, for: .normal)
        setTitleColor(.secondaryLabel, for: .highlighted)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3,
                                                compatibleWith: .init(legibilityWeight: .bold))
        layer.cornerRadius = 10
        
        layer.shadowColor = UIColor.systemGray4.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
}
