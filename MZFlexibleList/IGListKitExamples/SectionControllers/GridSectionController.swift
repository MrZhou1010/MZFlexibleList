//
//  GridSectionController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

final class GridItem: NSObject {
    let color: UIColor
    let itemCount: Int
    var items: [String] = []
    
    init(color: UIColor, itemCount: Int) {
        self.color = color
        self.itemCount = itemCount
        super.init()
        self.items = self.computeItems()
    }
    
    private func computeItems() -> [String] {
        return [Int](1...self.itemCount).map {
            String(describing: $0)
        }
    }
}

// MARK: - ListDiffable
extension GridItem: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self === object ? true : self.isEqual(object)
    }
}

class GridSectionController: ListSectionController {
    
    private var object: GridItem?
    /// 是否可以再减额
    private let isReorderable: Bool
    
    required init(isReorderable: Bool = false) {
        self.isReorderable = isReorderable
        super.init()
        self.minimumLineSpacing = 10.0
        self.minimumInteritemSpacing = 10.0
    }
    
    override func numberOfItems() -> Int {
        return self.object?.itemCount ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = self.collectionContext?.containerSize.width ?? 0
        let itemSize = floor(width / 4.0)
        return CGSize(width: itemSize, height: itemSize)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as? CenterLabelCell else {
            fatalError()
        }
        cell.text = self.object?.items[index] ?? "undefined"
        cell.backgroundColor = self.object?.color
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? GridItem
    }
    
    // 是否可以移动item
    override func canMoveItem(at index: Int) -> Bool {
        return self.isReorderable
    }
    
    // 移动item
    override func moveObject(from sourceIndex: Int, to destinationIndex: Int) {
        guard let obj = self.object else {
            return
        }
        let item = obj.items.remove(at: sourceIndex)
        obj.items.insert(item, at: destinationIndex)
    }
}
