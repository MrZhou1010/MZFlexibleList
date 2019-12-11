//
//  FullWidthSelfSizingCell.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class FullWidthSelfSizingCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var text: String? {
        get {
            return self.label.text
        }
        set {
            self.label.text = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.label)

        NSLayoutConstraint(item: self.label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.contentView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 15).isActive = true
        NSLayoutConstraint(item: self.label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.contentView,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 15).isActive = true
        NSLayoutConstraint(item: self.contentView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self.label,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 15).isActive = true
        NSLayoutConstraint(item: self.contentView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.label,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 15).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = self.contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}
