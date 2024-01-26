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
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true) /// Hide Navigation Title
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
        textField.delegate = self
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            textField.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        ///Add Button
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushFollowersList), for: .touchUpInside)
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            actionButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    /// Dismiss Keyboard when tab on the Screen
    func createDismissKeyboardTapGesture() {
        let tab = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tab)
    }
    
    /// Move to the FollowerList ViewController -> press ActionButton or Go on Keyboard
    @objc func pushFollowersList() {
        
        guard isUserNameValid else { 
            presentGFAlert(title: "Empty Username",
                           message: "Please enter a username.\nWe need to now who to look for.\n🔥",
                           buttonTitle: "Ok")
            return
        }
        
        let vc = FollowersListVC()
        vc.userName = textField.text
        vc.title = textField.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Basic Validation TextField
    var isUserNameValid: Bool {
        let isEmpty = textField.text?.isEmpty                  /// Check is Empty
        let isEnoughSymbols = textField.text?.count ?? 0 > 2   /// Check is more then 3 Symbols
        if let isEmpty, isEnoughSymbols {
            return !isEmpty
        } else {
            return false
        }
    }
}

//MARK: - Text Field Delegate
extension SearchVC: UITextFieldDelegate {
    
    ///For Go Button in Keyboard -> Send Data user name to the FollowersListVC and close Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pushFollowersList()
        return true
    }
}
