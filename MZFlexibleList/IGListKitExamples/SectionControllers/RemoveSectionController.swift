//
//  RemoveSectionController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

protocol RemoveSectionControllerDelegate: class {
    func removeSectionControllerWantsRemoved(_ sectionController: RemoveSectionController)
}

class RemoveSectionController: ListSectionController, RemoveCellDelegate {
    
    weak var delegate: RemoveSectionControllerDelegate?
    
    private var number: Int?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: RemoveCell.self, for: self, at: index) as? RemoveCell else {
            fatalError()
        }
        cell.text = "Cell: \((number ?? 0) + 1)"
        cell.delegate = self
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.number = object as? Int
    }
    
    /// MARK: RemoveCellDelegate
    func removeCellDidTapButton(_ cell: RemoveCell) {
        self.delegate?.removeSectionControllerWantsRemoved(self)
    }
}
