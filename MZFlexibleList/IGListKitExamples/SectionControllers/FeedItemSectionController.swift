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
        return CGSize(width: self.collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = feedItem.comments[index]
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.feedItem = object as? FeedItem
    }
}

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
        return CGSize(width: self.collectionContext!.containerSize.width, height: 40)
    }
    
    private func userHeaderView(atIndex index: Int) -> UICollectionReusableView {
        let view = self.collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: self, nibName: "UserHeaderView", bundle: nil, at: index) as? UserHeaderView
        if view == nil {
            fatalError()
        }
        view!.handle = "@" + feedItem.user.handle
        view!.name = feedItem.user.name
        return view!
    }
    
    private func userFooterView(atIndex index: Int) -> UICollectionReusableView {
        guard let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, for: self, nibName: "UserFooterView", bundle: nil, at: index) as? UserFooterView else {
            fatalError()
        }
        view.commentsCount = "\(feedItem.comments.count)"
        return view
    }
    
    
}
