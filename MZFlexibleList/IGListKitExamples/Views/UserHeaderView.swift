//
//  UserHeaderView.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class UserHeaderView: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var handleLabel: UILabel!

    public var name: String? {
        get {
            return self.nameLabel.text
        }
        set {
            self.nameLabel.text = newValue
        }
    }

    public var handle: String? {
        get {
            return self.handleLabel.text
        }
        set {
            self.handleLabel.text = newValue
        }
    }
}
