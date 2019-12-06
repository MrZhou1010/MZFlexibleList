//
//  SelectionModel.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import IGListKit

enum SelectionModelType: Int {
    case none
    case fullWidth
    case nib
}

class SelectionModel: NSObject {
    let options: [String]
    let type: SelectionModelType
    
    init(options: [String], type: SelectionModelType = .none) {
        self.options = options
        self.type = type
    }
}

extension SelectionModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.isEqual(object)
    }
}
