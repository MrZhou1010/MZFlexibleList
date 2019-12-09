//
//  EmbeddedSectionController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class EmbeddedSectionController: ListSectionController {
    
    private var number: Int?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext?.containerSize.height ?? 0
        return CGSize(width: height, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as? CenterLabelCell else {
            fatalError()
        }
        let value = self.number ?? 0
        cell.text = "\(value + 1)"
        cell.backgroundColor = UIColor(red: 237.0 / 255.0, green: 73.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.number = object as? Int
    }
}
