//
//  SingleSectionStoryboardViewController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class SingleSectionStoryboardViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()

    @IBOutlet weak var collectionView: UICollectionView!

    let data = Array(0 ..< 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.adapter.dataSource = self
        self.adapter.collectionView = self.collectionView
    }
}

// MARK: - ListAdapterDataSource
extension SingleSectionStoryboardViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.data as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let configureBlock = { (item: Any, cell: UICollectionViewCell) in
            guard let cell = cell as? StoryboardCell, let number = item as? Int else {
                return
            }
            cell.text = "Cell: \(number + 1)"
        }
        let sizeBlock = { (item: Any, context: ListCollectionContext?) -> CGSize in
            guard let context = context else {
                return .zero
            }
            return CGSize(width: context.containerSize.width, height: 44)
        }
        let sectionController = ListSingleSectionController(storyboardCellIdentifier: "cell", configureBlock: configureBlock, sizeBlock: sizeBlock)
        sectionController.selectionDelegate = self
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MARK: - ListSingleSectionControllerDelegate
extension SingleSectionStoryboardViewController: ListSingleSectionControllerDelegate {
    func didSelect(_ sectionController: ListSingleSectionController, with object: Any) {
        let section = self.adapter.section(for: sectionController) + 1
        let alertVC = UIAlertController(title: "Section \(section) was selected \u{1F389}", message: nil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func didDeselect(_ sectionController: ListSingleSectionController, with object: Any) {
       
    }
}
