//
//  DemosViewController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/9.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class DemosViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        return adapter
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let demos: [DemoItem] = [
        DemoItem(name: "Tail Loading", controllerClass: LoadMoreViewController.self),
        DemoItem(name: "Search Autocomplete", controllerClass: SearchViewController.self),
        DemoItem(name: "Mixed Data", controllerClass: MixedDataViewController.self),
        DemoItem(name: "Nested Adapter", controllerClass: NestedAdapterViewController.self),
        DemoItem(name: "Empty View", controllerClass: EmptyViewController.self),
        DemoItem(name: "Single Section Controller", controllerClass: SingleSectionViewController.self),
        DemoItem(name: "Storyboard", controllerClass: SingleSectionViewController.self, controllerIdentifier: "demo"),
        DemoItem(name: "Single Section Storyboard", controllerClass: SingleSectionStoryboardViewController.self, controllerIdentifier: "singleSectionDemo"),
        DemoItem(name: "Working Range", controllerClass: WorkingRangeViewController.self),
        DemoItem(name: "Diff Algorithm", controllerClass: DiffTableViewController.self),
        DemoItem(name: "Supplementary Views", controllerClass: SupplementaryViewController.self),
        DemoItem(name: "Self-sizing cells", controllerClass: SelfSizingCellsViewController.self),
        DemoItem(name: "Display delegate", controllerClass: DisplayViewController.self),
        DemoItem(name: "Objc Demo", controllerClass: ObjcDemoViewController.self),
        DemoItem(name: "Objc Generated Model Demo", controllerClass: ObjcGeneratedModelDemoViewController.self),
        DemoItem(name: "Calendar (auto diffing)", controllerClass: CalendarViewController.self),
        DemoItem(name: "Dependency Injection", controllerClass: AnnouncingDepsViewController.self),
        DemoItem(name: "Reorder Cells", controllerClass: ReorderableViewController.self)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Demos"
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

extension DemosViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.demos
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return DemoSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
