//
//  RemoveCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

protocol RemoveCellDelegate: class {
    func removeCellDidTapButton(_ cell: RemoveCell)
}

final class RemoveCell: UICollectionViewCell {
    
    public weak var delegate: RemoveCellDelegate?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        self.contentView.addSubview(label)
        return label
    }()
    
    fileprivate lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("Remove", for: UIControl.State())
        button.setTitleColor(.blue, for: UIControl.State())
        button.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        self.contentView.addSubview(button)
        return button
    }()
    
    public var text: String? {
        get {
            return self.label.text
        }
        set {
            self.label.text = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.backgroundColor = .white
        let bounds = self.contentView.bounds
        let divide = bounds.divided(atDistance: 100, from: .maxXEdge)
        self.label.frame = divide.slice.insetBy(dx: 15, dy: 0)
        self.button.frame = divide.remainder
    }
    
    @objc private func onButton(_ button: UIButton) {
        self.delegate?.removeCellDidTapButton(self)
    }
}
