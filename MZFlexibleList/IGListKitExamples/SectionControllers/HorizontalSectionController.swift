//
//  HorizontalSectionController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class HorizontalSectionController: ListSectionController {
    
    private var number: Int?
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as? EmbeddedCollectionViewCell else {
            fatalError()
        }
        self.adapter.collectionView = cell.collectionView
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.number = object as? Int
    }
}

// MARK: - ListAdapterDataSource
extension HorizontalSectionController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let number = self.number else {
            return []
        }
        return (0 ..< number).map {
            $0 as ListDiffable
        }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return EmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
