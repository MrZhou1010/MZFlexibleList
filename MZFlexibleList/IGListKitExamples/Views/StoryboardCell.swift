//
//  StoryboardCell.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class StoryboardCell: UICollectionViewCell {
    
    @IBOutlet private weak var textLabel: UILabel!
    
    var text: String? {
        get {
            return self.textLabel.text
        }
        set {
            self.textLabel.text = newValue
        }
    }
}
