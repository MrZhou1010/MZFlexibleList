//
//  LoadMoreViewController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class LoadMoreViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        return adapter
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var items = Array(0...20)
    var loading = false
    let spinToken = "spinner"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView)
        self.adapter.dataSource = self
        self.adapter.scrollViewDelegate = self
        self.adapter.collectionView = self.collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }
}

// MARK: - ListAdapterDataSource
extension LoadMoreViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = self.items as [ListDiffable]
        if self.loading {
            objects.append(self.spinToken as ListDiffable)
        }
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let obj = object as? String, obj == self.spinToken {
            return spinnerSectionController(object: self.spinToken)
        } else {
            return LabelSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MARK: - UIScrollViewDelegate
extension LoadMoreViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if !self.loading && distance < 200 {
            self.loading = true
            self.adapter.performUpdates(animated: true, completion: nil)
            // 上拉刷新获取更多数据
            DispatchQueue.global(qos: .default).async {
                // fake background loading task
                sleep(2)
                DispatchQueue.main.async {
                    self.loading = false
                    let itemCount = self.items.count
                    self.items.append(contentsOf: Array(itemCount ..< itemCount + 5))
                    self.adapter.performUpdates(animated: true, completion: nil)
                }
            }
        }
    }
}
