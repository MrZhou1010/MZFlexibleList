//
//  SelfSizingSectionController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class SelfSizingSectionController: ListSectionController {
    
    private var model: SelectionModel!
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 10.0, right: 0)
        self.minimumLineSpacing = 4.0
        self.minimumInteritemSpacing = 4.0
    }
    
    override func numberOfItems() -> Int {
        return self.model.options.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 55.0)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let text = self.model.options[index]
        let cell: UICollectionViewCell
        switch self.model.type {
        case .none:
            guard let manualCell = self.collectionContext?.dequeueReusableCell(of: ManuallySelfSizingCell.self, for: self, at: index) as? ManuallySelfSizingCell else {
                fatalError()
            }
            manualCell.text = text
            cell = manualCell
        case .fullWidth:
            guard let fullCell = self.collectionContext?.dequeueReusableCell(of: FullWidthSelfSizingCell.self, for: self, at: index) as? FullWidthSelfSizingCell else {
                fatalError()
            }
            fullCell.text = text
            cell = fullCell
        case .nib:
            guard let nibCell = self.collectionContext?.dequeueReusableCell(withNibName: "NibSelfSizingCell", bundle: nil, for: self, at: index) as? NibSelfSizingCell else {
                fatalError()
            }
            nibCell.contentLabel.text = text
            cell = nibCell
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.model = object as? SelectionModel
    }
}
