//
//  UserSectionController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class UserSectionController: ListSectionController {
    
    private var user: User?
    
    private let isReorderable: Bool

    required init(isReorderable: Bool = false) {
        self.isReorderable = isReorderable
        super.init()
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 55.0)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: DetailLabelCell.self, for: self, at: index) as? DetailLabelCell else {
            fatalError()
        }
        cell.title = self.user?.name
        cell.detail = "@" + (self.user?.handle ?? "")
        return cell
    }

    override func didUpdate(to object: Any) {
        self.user = object as? User
    }

    override func canMoveItem(at index: Int) -> Bool {
        return self.isReorderable
    }
}
