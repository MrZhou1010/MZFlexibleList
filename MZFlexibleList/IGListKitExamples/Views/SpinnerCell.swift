//
//  SpinnerCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

public func spinnerSectionController(object: String) -> ListSingleSectionController {
    
    let configureBlock = { (item: Any, cell: UICollectionViewCell) in
        guard let cell = cell as? SpinnerCell else {
            return
        }
        cell.activityIndicator.startAnimating()
        cell.loadingLbl.text = object
    }
    
    let sizeBlock = { (item: Any, context: ListCollectionContext?) -> CGSize in
        guard let context = context else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: 30)
    }
    return ListSingleSectionController(cellClass: SpinnerCell.self, configureBlock: configureBlock, sizeBlock: sizeBlock)
}

final class SpinnerCell: UICollectionViewCell {
    
    public lazy var activityIndicator: UIActivityIndicatorView = {
        var view = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            view.style = .medium
        } else {
            view.style = .gray
        }
        self.contentView.addSubview(view)
        return view
    }()
    
    public lazy var loadingLbl: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        self.contentView.addSubview(label)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.contentView.bounds
        self.activityIndicator.center = CGPoint(x: bounds.midX - 20.0, y: bounds.midY)
        self.loadingLbl.frame = CGRect(x: bounds.midX + 10.0, y: 0, width: bounds.width - (bounds.midX + 10.0), height: bounds.height)
    }
}
