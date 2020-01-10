//
//  SupplementaryViewController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class SupplementaryViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let feedItems = [FeedItem(pk: 1, user: User(pk: 100, name: "Jesse", handle: "jesse_squires"), comments: ["You rock!", "Hmm you sure about that?"]),
                     FeedItem(pk: 2, user: User(pk: 101, name: "Ryan", handle: "_ryannystrom"), comments: ["lgtm", "lol", "Let's try it!"]),
                     FeedItem(pk: 3, user: User(pk: 102, name: "Ann", handle: "abaum"), comments: ["Good luck!"]),
                     FeedItem(pk: 4, user: User(pk: 103, name: "Phil", handle: "phil"), comments: ["yoooooooo", "What's the eta?"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView)
        self.adapter.dataSource = self
        self.adapter.collectionView = self.collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }
}

// MARK: - ListAdapterDataSource
extension SupplementaryViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.feedItems
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return FeedItemSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
