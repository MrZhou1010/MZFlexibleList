//
//  CenterLabelCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class CenterLabelCell: UICollectionViewCell {
    
    /// 文本内容
    public var text: String? {
        get {
            return self.label.text
        }
        set {
            self.label.text = newValue
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        self.contentView.addSubview(label)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.frame = self.contentView.bounds
    }
}
