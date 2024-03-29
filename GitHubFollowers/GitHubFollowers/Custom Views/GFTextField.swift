//
//  GFTextField.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 11/01/2024.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray2.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true /// If long make it fit
        minimumFontSize = 12             /// But no more then 12
        
        backgroundColor = .tertiarySystemBackground
        
        autocorrectionType = .no
        returnKeyType = .go
        keyboardType = .default
        placeholder = "Enter a username"
    }
}
