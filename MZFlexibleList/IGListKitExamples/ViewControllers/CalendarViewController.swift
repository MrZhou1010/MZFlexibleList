//
//  CalendarViewController.swift
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class CalendarViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ListCollectionViewLayout(stickyHeaders: false, topContentInset: 0, stretchToEdge: false)
    )
    
    var months = [Month]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let date = Date()
        let currentMonth = Calendar.current.component(.month, from: date)
        let month = Month(
            name: DateFormatter().monthSymbols[currentMonth - 1],
            days: 30,
            appointments: [
                2: ["Hair"],
                4: ["Nails"],
                7: ["Doctor appt", "Pick up groceries"],
                12: ["Call back the cable company", "Find a babysitter"],
                13: ["Dinner at The Smith"],
                17: ["Buy running shoes", "Buy a fitbit", "Start running"],
                20: ["Call mom"],
                21: ["Contribute to IGListKit"],
                25: ["Interview"],
                26: ["Quit running", "Buy ice cream"]
            ]
        )
        self.months.append(month)
        self.collectionView.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView)
        self.adapter.dataSource = self
        self.adapter.collectionView = self.collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }
}

// MARK: - ListAdapterDataSource
extension CalendarViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.months
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return MonthSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
