//
//  DayViewModel.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import IGListKit

class DayViewModel: NSObject {
    let day: Int
    let today: Bool
    let selected: Bool
    let appointments: Int
    
    init(day: Int, today: Bool, selected: Bool, appointments: Int) {
        self.day = day
        self.today = today
        self.selected = selected
        self.appointments = appointments
    }
}

extension DayViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.day as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object {
            return true
        }
        guard let obj = object as? DayViewModel else {
            return false
        }
        return self.today == obj.today && self.selected == obj.selected && self.appointments == obj.appointments
    }
}
