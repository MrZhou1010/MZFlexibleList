//
//  NibSelfSizingCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

final class NibSelfSizingCell: UICollectionViewCell {

    @IBOutlet weak var contentLabel: UILabel!

    private var content: String? {
        get {
            return self.contentLabel.text
        }
        set {
            self.contentLabel.text = newValue
        }
    }
}
