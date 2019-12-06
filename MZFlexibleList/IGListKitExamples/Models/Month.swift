//
//  Month.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import IGListKit

class Month: NSObject {
    let name: String
    let days: Int
    let appointments: [Int: [NSString]]
    
    init(name: String, days: Int, appointments: [Int: [NSString]]) {
        self.name = name
        self.days = days
        self.appointments = appointments
    }
}

extension Month: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.name as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}
