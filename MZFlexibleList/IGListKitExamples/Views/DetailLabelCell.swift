//
//  DetailLabelCell.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class DetailLabelCell: UICollectionViewCell {
    
    public var title: String? {
        get {
            return self.titleLabel.text
        }
        set {
            self.titleLabel.text = newValue
        }
    }
    
    public var detail: String? {
        get {
            return self.detailLabel.text
        }
        set {
            self.detailLabel.text = newValue
        }
    }
    
    fileprivate let padding: CGFloat = 15.0
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = .darkText
        view.font = UIFont.systemFont(ofSize: 17)
        view.textAlignment = .left
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var detailLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = .lightGray
        view.font = UIFont.systemFont(ofSize: 17)
        view.textAlignment = .right
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame = self.contentView.bounds.insetBy(dx: self.padding, dy: 0)
        self.titleLabel.frame = frame
        self.detailLabel.frame = frame
    }
}
