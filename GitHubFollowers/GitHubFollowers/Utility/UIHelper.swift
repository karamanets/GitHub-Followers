//
//  UIHelper.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 24/02/2024.
//

import UIKit

struct UIHelper {
    
    /// Create Three Column for CollectionView
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width: CGFloat = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth: CGFloat = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth: CGFloat = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + (padding * 3))
        
        return flowLayout
    }
}

