//
//  MonthTitleViewModel.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import IGListKit

class MonthTitleViewModel: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension MonthTitleViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.name as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object {
            return true
        }
        guard object is MonthTitleViewModel else {
            return false
        }
        return true
    }
}
