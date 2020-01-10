//
//  ReorderableViewController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class ReorderableViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var data = Array(0 ..< 20).map {
        "Cell: \($0 + 1)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if #available(iOS 9.0, *) {
            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongGesture(gesture:)))
            self.collectionView.addGestureRecognizer(longPressGesture)
        }
        self.collectionView.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView)
        self.adapter.dataSource = self
        self.adapter.collectionView = self.collectionView
        if #available(iOS 9.0, *) {
            self.adapter.moveDelegate = self
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }
    
    @available(iOS 9.0, *)
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            let touchLocation = gesture.location(in: self.collectionView)
            guard let selectedIndexPath = self.collectionView.indexPathForItem(at: touchLocation) else {
                break
            }
            self.collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            if let view = gesture.view {
                let position = gesture.location(in: view)
                self.collectionView.updateInteractiveMovementTargetPosition(position)
            }
        case .ended:
            self.collectionView.endInteractiveMovement()
        default:
            self.collectionView.cancelInteractiveMovement()
        }
    }
}

// MARK: - ListAdapterDataSource
extension ReorderableViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.data as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ReorderableSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MARK: - ListAdapterMoveDelegate
extension ReorderableViewController: ListAdapterMoveDelegate {
    func listAdapter(_ listAdapter: ListAdapter, move object: Any, from previousObjects: [Any], to objects: [Any]) {
        guard let objects = objects as? [String] else {
            return
        }
        self.data = objects
    }
}
