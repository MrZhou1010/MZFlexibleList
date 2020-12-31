//
//  EmptyViewController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class EmptyViewController: UIViewController {
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "No more data!"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var tally = 4

    private var data = [1, 2, 3, 4]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        self.view.addSubview(self.collectionView)
        self.adapter.dataSource = self
        self.adapter.collectionView = self.collectionView
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAdd))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }

    @objc private func onAdd() {
        self.data.append(self.tally + 1)
        self.tally += 1
        self.adapter.performUpdates(animated: true, completion: nil)
    }
}

// MARK: - ListAdapterDataSource
extension EmptyViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.data as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = RemoveSectionController()
        sectionController.delegate = self
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return self.emptyLabel
    }
}

// MARK: - RemoveSectionControllerDelegate
extension EmptyViewController: RemoveSectionControllerDelegate {
    func removeSectionControllerWantsRemoved(_ sectionController: RemoveSectionController) {
        let section = self.adapter.section(for: sectionController)
        guard let obj = self.adapter.object(atSection: section) as? Int, let index = self.data.firstIndex(of: obj) else {
            return
        }
        self.data.remove(at: index)
        self.adapter.performUpdates(animated: true, completion: nil)
    }
}
