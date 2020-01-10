//
//  MonthTitleCell.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class MonthTitleCell: UICollectionViewCell {
    
    fileprivate lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = UIColor(white: 0.7, alpha: 1)
        view.font = UIFont.boldSystemFont(ofSize: 13)
        view.textAlignment = .center
        self.contentView.addSubview(view)
        return view
    }()
    
    var text: String? {
        get {
            return self.label.text
        }
        set {
            self.label.text = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.frame = self.contentView.bounds
    }
}

// MARK: - ListBindable
extension MonthTitleCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? MonthTitleViewModel else {
            return
        }
        self.label.text = viewModel.name.uppercased()
    }
}
