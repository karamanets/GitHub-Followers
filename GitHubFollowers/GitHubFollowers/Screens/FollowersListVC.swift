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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

//MARK: Private Methods
private extension FollowersListVC {
    
    ///Initialize
    func initialize() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let userName {
            NetworkManager.shared.getFollowers(for: userName, page: 1) { result in
                switch result {
                case .success(let followers):
                    print(followers)
                case .failure(let error):
                    self.presentGFAlert(title: "Error ⚠️", message: error.rawValue, buttonTitle: "Ok")
                }
            }
        }
    }
}
