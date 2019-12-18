//
//  WorkingRangeSectionController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class WorkingRangeSectionController: ListSectionController, ListWorkingRangeDelegate {
    
    private var height: Int?
    private var downloadedImage: UIImage?
    private var task: URLSessionDataTask?
    
    private var urlString: String? {
        guard let height = self.height, let size = self.collectionContext?.containerSize else {
            return nil
        }
        let width = Int(size.width)
        return "https://unsplash.it/" + width.description + "/" + height.description
    }
    
    deinit {
        self.task?.cancel()
    }
    
    override init() {
        super.init()
        self.workingRangeDelegate = self
    }
    
    override func numberOfItems() -> Int {
        return 2
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = self.collectionContext?.containerSize.width ?? 0
        let height: CGFloat = CGFloat(index == 0 ? 55 : (self.height ?? 0))
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass = index == 0 ? LabelCell.self : ImageCell.self
        let cell = self.collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        if let cell = cell as? LabelCell {
            cell.text = self.urlString
        } else if let cell = cell as? ImageCell {
            cell.setImage(image: self.downloadedImage)
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.height = object as? Int
    }
    
    // MARK: - ListWorkingRangeDelegate
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerWillEnterWorkingRange sectionController: ListSectionController) {
        guard self.downloadedImage == nil, self.task == nil, let urlString = self.urlString, let url = URL(string: urlString) else {
            return
        }
        print("Downloading image \(urlString) for section \(self.section)")
        self.task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, let image = UIImage(data: data) else {
                return print("Error downloading \(urlString): " + String(describing: error))
            }
            DispatchQueue.main.async {
                self.downloadedImage = image
                if let cell = self.collectionContext?.cellForItem(at: 1, sectionController: self) as? ImageCell {
                    cell.setImage(image: image)
                }
            }
        }
        self.task?.resume()
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerDidExitWorkingRange sectionController: ListSectionController) {
        
    }
}
