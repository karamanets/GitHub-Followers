//
//  SceneDelegate.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 09/01/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
 
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
        
        configureNavigationBar()
    }
    
    //MARK: - Default
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

//MARK: Private Methods
private extension SceneDelegate {
    
    /// Setup for Search Tab Item
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    /// Setup for Favorite Tab item
    func createFavoriteNC() -> UINavigationController {
        let favoriteVC = FavoritesListVC()
        favoriteVC.title = "Favorite"
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoriteVC)
    }
    
    /// Setup TabBar
    func createTabBar() -> UITabBarController {
        
        /// Navigation Controllers
        let searchNC = createSearchNC()
        let favoriteNC = createFavoriteNC()
        
        /// Tab Bar Controller
        let tabBar = UITabBarController()
        
        /// Colors of Icons
        tabBar.tabBar.tintColor = .systemGreen
        tabBar.tabBar.unselectedItemTintColor = .systemGray
        
        /// Background Color of Tab Bar
        tabBar.tabBar.backgroundColor = .systemGray4
        
        /// Add Navigation Controllers to Tab Bar
        tabBar.viewControllers = [searchNC, favoriteNC]
        
        return tabBar
    }
    
    /// Change Tint Color for Navigation Bar (Go Back button Color)
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
}
