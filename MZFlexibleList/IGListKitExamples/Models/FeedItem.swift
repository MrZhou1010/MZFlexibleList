//
//  FeedItem.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import IGListKit

class FeedItem: ListDiffable {
    let pk: Int
    let user: User
    let comments: [String]
    
    init(pk: Int, user: User, comments: [String]) {
        self.pk = pk
        self.user = user
        self.comments = comments
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self.pk as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else {
            return true
        }
        guard let obj = object as? FeedItem else {
            return false
        }
        return self.user.isEqual(toDiffableObject: obj.user) && self.comments == obj.comments
    }
}
