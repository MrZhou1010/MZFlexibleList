//
//  ImageCell.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    fileprivate let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    fileprivate let activityView: UIActivityIndicatorView = {
        if #available(iOS 13.0, *) {
            let view = UIActivityIndicatorView(style: .medium)
            view.startAnimating()
            return view
        } else {
            let view = UIActivityIndicatorView(style: .white)
            view.startAnimating()
            return view
        }
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.activityView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.contentView.bounds
        self.activityView.center = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
        self.imageView.frame = bounds
    }
    
    public func setImage(image: UIImage?) {
        self.imageView.image = image
        if image != nil {
            self.activityView.stopAnimating()
        } else {
            self.activityView.startAnimating()
        }
    }
}
