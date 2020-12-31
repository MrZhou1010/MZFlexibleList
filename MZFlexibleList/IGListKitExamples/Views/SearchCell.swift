//
//  SearchCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    public lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.searchBarStyle = .minimal
        view.tintColor = UIColor.blue
        view.placeholder = "Search"
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.searchBar.frame = self.contentView.bounds
    }
}
