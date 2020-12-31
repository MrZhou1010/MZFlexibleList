//
//  FeedItemSectionController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class FeedItemSectionController: ListSectionController {
    
    private var feedItem: FeedItem!
    
    override init() {
        super.init()
        self.supplementaryViewSource = self
    }
    
    override func numberOfItems() -> Int {
        return self.feedItem.comments.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 55.0)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = self.feedItem.comments[index]
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.feedItem = object as? FeedItem
    }
}

// MARK: - ListSupplementaryViewSource
extension FeedItemSectionController: ListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionView.elementKindSectionHeader, UICollectionView.elementKindSectionFooter]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        switch elementKind {
        case UICollectionView.elementKindSectionHeader:
            return self.userHeaderView(atIndex: index)
        case UICollectionView.elementKindSectionFooter:
            return self.userFooterView(atIndex: index)
        default:
            fatalError()
        }
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 40.0)
    }
    
    private func userHeaderView(atIndex index: Int) -> UICollectionReusableView {
        guard let view = self.collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: self, nibName: "UserHeaderView", bundle: nil, at: index) as? UserHeaderView else {
            fatalError()
        }
        view.name = self.feedItem.user.name
        view.handle = "@" + self.feedItem.user.handle
        return view
    }
    
    private func userFooterView(atIndex index: Int) -> UICollectionReusableView {
        guard let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, for: self, nibName: "UserFooterView", bundle: nil, at: index) as? UserFooterView else {
            fatalError()
        }
        view.commentsCount = "\(self.feedItem.comments.count)"
        return view
    }
}
