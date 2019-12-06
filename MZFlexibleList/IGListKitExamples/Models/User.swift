//
//  User.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import IGListKit

class User: ListDiffable {
    let pk: Int
    let name: String
    let handle: String
    
    init(pk: Int, name: String, handle: String) {
        self.pk = pk
        self.name = name
        self.handle = handle
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self.pk as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else {
            return true
        }
        guard let obj = object as? User else {
            return false
        }
        return self.name == obj.name && self.handle == obj.handle
    }
}
