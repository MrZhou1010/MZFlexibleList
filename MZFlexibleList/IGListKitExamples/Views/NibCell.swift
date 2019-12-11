//
//  NibCell.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

final class NibCell: UICollectionViewCell {
    
    static let nibName = "NibCell"
    
    @IBOutlet private var textLabel: UILabel!
    
    var text: String? {
        didSet {
            self.textLabel.text = self.text
        }
    }
}
