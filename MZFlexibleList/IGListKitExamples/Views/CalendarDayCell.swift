//
//  CalendarDayCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class CalendarDayCell: UICollectionViewCell {
    
    lazy fileprivate var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textAlignment = .center
        view.layer.borderWidth = 2
        view.clipsToBounds = true
        self.contentView.addSubview(view)
        return view
    }()

    lazy fileprivate var dotsLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.textColor = .red
        view.font = .boldSystemFont(ofSize: 30)
        self.contentView.addSubview(view)
        return view
    }()
}
