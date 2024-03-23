//
//  PresentAlert.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 20/01/2024.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    /// Show Alert
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    /// Show Loading View
    func showLoadingView() {
        /// Add with Animation transparent background
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        /// Add Activity Indicator on center of container
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    /// Dismiss Loading View
    func dismissLoadingView() {
        /// Cools from background thread
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    /// Show Empty View
    func ShowEmptyStateView(with message: String, in view: UIView) {
        let emptyView = GFEmptyView(message: message)
        emptyView.frame = view.bounds
        view.addSubview(emptyView)
    }
}
