//
//  ManuallySelfSizingCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class ManuallySelfSizingCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green.withAlphaComponent(0.1)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var text: String? {
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
        newFrame.size.width = ceil(size.width)
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}
