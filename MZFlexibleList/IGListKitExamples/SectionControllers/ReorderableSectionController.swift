//
//  ReorderableSectionController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class ReorderableSectionController: ListSectionController {
    
    private var object: String?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = self.object
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
    
    override func canMoveItem(at index: Int) -> Bool {
        return true
    }
}
