//
//  ExpandableSectionController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class ExpandableSectionController: ListSectionController {
    
    /// 是否扩大
    private var expanded = false
    private var object: String?
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = self.collectionContext!.containerSize.width
        let height = self.expanded ? LabelCell.textHeight(self.object ?? "", width: width) : LabelCell.singleLineHeight
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text =  self.object
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? String
    }
    
    override func didSelectItem(at index: Int) {
        self.expanded = !self.expanded
        // 扩大动画
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: [], animations: {
            self.collectionContext?.invalidateLayout(for: self, completion: nil)
        }, completion: nil)
    }
}
