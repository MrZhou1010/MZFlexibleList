//
//  SpinnerCell.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

func spinnerSectionController() -> ListSingleSectionController {
    let configureBlock = { (item: Any, cell: UICollectionViewCell) in
        guard let cell = cell as? SpinnerCell else {
            return
        }
        cell.activityIndicator.startAnimating()
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

    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        self.contentView.addSubview(view)
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.contentView.bounds
        self.activityIndicator.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}
