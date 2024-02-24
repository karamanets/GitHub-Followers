//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 17/01/2024.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var userName: String?
    
    private var collectionsView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Sections, Follower>!
    
    private var followers: [Follower] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureCollectionView()
        getFollowers()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

//MARK: Private Methods
private extension FollowersListVC {
    
    /// SetUo for VC
    func configureVC() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /// SetUp for CollectionView
    func configureCollectionView() {
        collectionsView = UICollectionView(frame: view.bounds,
                                           collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionsView)
        collectionsView.backgroundColor = .systemBackground
        collectionsView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseId)
    }
        
    /// Configure Cell for Collection View by using DiffableDataSource
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionsView,
                                                        cellProvider: { (collectionView,
                                                                         indexPath,
                                                                         follower) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseId, for: indexPath) as!  FollowerCell
            cell.configureCell(follower: follower)
            
            return cell
        })
    }
    
    /// Sections of Collection View
    enum Sections { case main }
    
    /// Get Followers List
    func getFollowers() {
        if let userName {
            NetworkManager.shared.getFollowers(for: userName, page: 1) { [weak self] result in
                
                guard let self else { return }
                
                switch result {
                case .success(let followers):
                    self.followers = followers
                    self.updateData()
                case .failure(let error):
                    self.presentGFAlert(title: "Error ⚠️", message: error.rawValue, buttonTitle: "Ok")
                }
            }
        }
    }
    
    //MARK: - Internal extension methods
    
    /// Update Data of Followers
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
