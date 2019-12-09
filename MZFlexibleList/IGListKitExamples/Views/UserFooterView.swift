//
//  UserFooterView.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class UserFooterView: UICollectionViewCell {

    @IBOutlet private weak var commentsCountLabel: UILabel!

    var commentsCount: String? {
        get {
            return self.commentsCountLabel.text
        }
        set {
            self.commentsCountLabel.text = newValue
        }
    }
}
