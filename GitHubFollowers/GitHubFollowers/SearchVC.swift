//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 09/01/2024.
//

import UIKit

class SearchVC: UIViewController {
    
    private let logoImageView = UIImageView()
    private let textField = GFTextField()
    private let actionButton = GFButton(background: .systemGreen, title: "Get Followers")

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true /// Hide Navigation Title
    }
}

//MARK: - Private Methods
private extension SearchVC {
    
    func initialize() {
        ///Add Background
        view.backgroundColor = .systemBackground
        
        ///Add Image
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        ///Add Text Field
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            textField.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        ///Add Button
        view.addSubview(actionButton)
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            actionButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
