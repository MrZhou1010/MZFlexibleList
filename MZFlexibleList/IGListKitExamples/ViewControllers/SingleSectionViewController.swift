//
//  SingleSectionViewController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class SingleSectionViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    let data = Array(0..<20)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.collectionView)
        self.adapter.dataSource = self
        self.adapter.collectionView = self.collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }
}

extension SingleSectionViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.data as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let configureBlock = { (item: Any, cell: UICollectionViewCell) in
            guard let cell = cell as? NibCell, let number = item as? Int else {
                return
            }
            cell.text = "Cell: \(number + 1)"
        }
        let sizeBlock = { (item: Any, context: ListCollectionContext?) -> CGSize in
            guard let context = context else {
                return CGSize()
            }
            return CGSize(width: context.containerSize.width, height: 44)
        }
        let sectionController = ListSingleSectionController(nibName: NibCell.nibName, bundle: nil, configureBlock: configureBlock, sizeBlock: sizeBlock)
        sectionController.selectionDelegate = self
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension SingleSectionViewController: ListSingleSectionControllerDelegate {
    func didSelect(_ sectionController: ListSingleSectionController, with object: Any) {
        let section = self.adapter.section(for: sectionController) + 1
        let alert = UIAlertController(title: "Section \(section) was selected \u{1F389}", message: "Cell Object: " + String(describing: object), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
