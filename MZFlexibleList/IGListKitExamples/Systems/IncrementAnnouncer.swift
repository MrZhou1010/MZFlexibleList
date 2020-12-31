//
//  IncrementAnnouncer.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

@objc protocol IncrementListener: class {
    func didIncrement(announcer: IncrementAnnouncer, value: Int)
}

class IncrementAnnouncer: NSObject {
    
    private var value: Int = 0
    
    private let map: NSHashTable<IncrementListener> = NSHashTable<IncrementListener>.weakObjects()
    
    public func addListener(listener: IncrementListener) {
        self.map.add(listener)
    }
    
    public func increment() {
        self.value += 1
        for listener in self.map.allObjects {
            listener.didIncrement(announcer: self, value: self.value)
        }
    }
}
