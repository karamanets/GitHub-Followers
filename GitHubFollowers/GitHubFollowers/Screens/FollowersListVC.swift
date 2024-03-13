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
    
    private var page = 1
    private var isHasMoreFollowers = true

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureCollectionView()
        getFollowers(userName: userName, page: page)
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
        collectionsView.delegate = self
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
    func getFollowers(userName: String?, page: Int) {
        if let userName {
            showLoadingView()
            NetworkManager.shared.getFollowers(for: userName, page: page) { [weak self] result in
                
                guard let self else { return }
                
                dismissLoadingView()
                
                switch result {
                case .success(let followers):
                    if followers.count < 100 { isHasMoreFollowers = false }
                    self.followers.append(contentsOf: followers)
                    self.updateData()
                case .failure(let error):
                    self.presentGFAlert(title: "Error ⚠️", message: error.rawValue, buttonTitle: "Ok")
                }
            }
        }
    }

    /// Update Data of Followers
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

//MARK: Delegates
extension FollowersListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        //print("offSetY: \(offSetY), contentHeight: \(contentHeight) Height: \(height)")
        
        if offSetY > contentHeight - height {
            guard isHasMoreFollowers else { return }
            page += 1
            getFollowers(userName: userName, page: page)
        }
    }
}
