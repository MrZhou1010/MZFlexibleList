//
//  LabelCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class LabelCell: UICollectionViewCell {
    
    public var text: String? {
        get {
            return self.label.text
        }
        set {
            self.label.text = newValue
        }
    }
    
    fileprivate static let insets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    fileprivate static let font = UIFont.systemFont(ofSize: 17)
    
    static var singleLineHeight: CGFloat {
        return self.font.lineHeight + self.insets.top + self.insets.bottom
    }
    
    static func textHeight(_ text: String, width: CGFloat) -> CGFloat {
        let constrainedSize = CGSize(width: width - self.insets.left - self.insets.right, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: font]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let boundRect = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        return ceil(boundRect.height) + self.insets.top + self.insets.bottom
    }
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = LabelCell.font
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(red: 200.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.label)
        self.contentView.layer.addSublayer(self.separator)
        self.contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.contentView.bounds
        self.label.frame = bounds.inset(by: LabelCell.insets)
        let height: CGFloat = 0.5
        let left = LabelCell.insets.left
        self.separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width - left, height: height)
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.contentView.backgroundColor = UIColor(white: self.isHighlighted ? 0.9 : 1.0, alpha: 1.0)
        }
    }
}

extension LabelCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? String else {
            return
        }
        self.label.text = viewModel
    }
}
