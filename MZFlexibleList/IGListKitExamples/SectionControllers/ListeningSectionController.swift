//
//  ListeningSectionController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class ListeningSectionController: ListSectionController {
    
    private var value: Int = 0

    init(announcer: IncrementAnnouncer) {
        super.init()
        announcer.addListener(listener: self)
    }

    func configureCell(cell: LabelCell) {
        cell.text = "Section: \(self.section), value: \(value)"
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 55)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        self.configureCell(cell: cell)
        return cell
    }
}

extension ListeningSectionController: IncrementListener {
    // MARK: IncrementListener
    func didIncrement(announcer: IncrementAnnouncer, value: Int) {
        self.value = value
        guard let cell = self.collectionContext?.cellForItem(at: 0, sectionController: self) as? LabelCell else {
            return
        }
        self.configureCell(cell: cell)
    }
}
