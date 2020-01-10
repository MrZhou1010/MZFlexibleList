//
//  StoryboardLabelSectionController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

protocol StoryboardLabelSectionControllerDelegate: class {
    func removeSectionControllerWantsRemoved(_ sectionController: StoryboardLabelSectionController)
}

class StoryboardLabelSectionController: ListSectionController {
    
    private var object: Person?
    
    weak var delegate: StoryboardLabelSectionControllerDelegate?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: (self.object?.name.count)! * 7, height: (self.object?.name.count)! * 7)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: "cell", for: self, at: index) as? StoryboardCell else {
            fatalError()
        }
        cell.text = self.object?.name
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? Person
    }
    
    override func didSelectItem(at index: Int) {
        self.delegate?.removeSectionControllerWantsRemoved(self)
    }
}
