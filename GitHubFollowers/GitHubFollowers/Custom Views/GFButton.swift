//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 11/01/2024.
//

import UIKit

class GFButton: UIButton {
    
    private let touchAreaPadding: CGFloat = 20

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
    
    /// Increase the touch area by 20 points from all sides
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        let largerArea = self.bounds.insetBy(dx: -touchAreaPadding, dy: -touchAreaPadding)
        
        return largerArea.contains(point)
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
