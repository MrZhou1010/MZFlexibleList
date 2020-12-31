//
//  CalendarDayCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class CalendarDayCell: UICollectionViewCell {
    
    fileprivate lazy var label: UILabel = {
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

    fileprivate lazy var dotsLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = .red
        view.font = .boldSystemFont(ofSize: 30)
        view.textAlignment = .center
        self.contentView.addSubview(view)
        return view
    }()
    
    public var text: String? {
        get {
            return self.label.text
        }
        set {
            self.label.text = newValue
        }
    }

    public var dots: String? {
        get {
            return self.dotsLabel.text
        }
        set {
            self.dotsLabel.text = newValue
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.contentView.bounds
        let half = bounds.height / 2.0
        self.label.frame = bounds
        self.label.layer.cornerRadius = half
        self.dotsLabel.frame = CGRect(x: 0, y: half - 10.0, width: bounds.width, height: half)
    }
}

// MARK: - ListBindable
extension CalendarDayCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DayViewModel else {
            return
        }
        self.label.text = viewModel.day.description
        self.label.layer.borderColor = viewModel.today ? UIColor.red.cgColor : UIColor.clear.cgColor
        self.label.backgroundColor = viewModel.selected ? UIColor.red.withAlphaComponent(0.3) : UIColor.clear
        var dots = ""
        for _ in 0 ..< viewModel.appointments {
            dots += "."
        }
        self.dotsLabel.text = dots
    }
}
