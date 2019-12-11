//
//  EmbeddedCollectionViewCell.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class EmbeddedCollectionViewCell: UICollectionViewCell {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.frame = self.contentView.frame
    }
}
