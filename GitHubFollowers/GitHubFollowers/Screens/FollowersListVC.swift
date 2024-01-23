//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 17/01/2024.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var userName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

//MARK: Private Methods
private extension FollowersListVC {
    
    ///Initialize
    func initialize() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
