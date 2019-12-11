//
//  DemoSectionController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class DemoItem: NSObject {
    let name: String
    let controllerClass: UIViewController.Type
    let controllerIdentifier: String?
    
    init(name: String, controllerClass: UIViewController.Type, controllerIdentifier: String? = nil) {
        self.name = name
        self.controllerClass = controllerClass
        self.controllerIdentifier = controllerIdentifier
    }
}

extension DemoItem: ListDiffable {
    /// 返回对象唯一id,在diff算法中以它作为元素存入哈希表的key
    func diffIdentifier() -> NSObjectProtocol {
        return self.name as NSObjectProtocol
    }
    
    /// 判断两个对象是否相等,在diff算法用这个方法判断两个对象是否是同一个对象
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object {
            return true
        }
        guard let obj = object as? DemoItem else {
            return false
        }
        return self.controllerClass == obj.controllerClass && self.controllerIdentifier == obj.controllerIdentifier
    }
}

class DemoSectionController: ListSectionController {
    
    private var object: DemoItem?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = self.object?.name
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? DemoItem
    }
    
    override func didSelectItem(at index: Int) {
        if let identifier = self.object?.controllerIdentifier {
            let storyboard = UIStoryboard(name: "Demo", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: identifier)
            controller.title = self.object?.name
            self.viewController?.navigationController?.pushViewController(controller, animated: true)
        } else if let controller = self.object?.controllerClass.init() {
            controller.title = self.object?.name
            self.viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
