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
        DemoItem(name: "Tail Loading",
                 controllerClass: LoadMoreViewController.self),
        DemoItem(name: "Search Autocomplete",
                 controllerClass: ViewController.self),//SearchViewController.self
        DemoItem(name: "Mixed Data",
                 controllerClass: ViewController.self),//MixedDataViewController.self
        DemoItem(name: "Nested Adapter",
                 controllerClass: ViewController.self),//NestedAdapterViewController.self
        DemoItem(name: "Empty View",
                 controllerClass: ViewController.self),//EmptyViewController.self
        DemoItem(name: "Single Section Controller",
                 controllerClass: ViewController.self),//SingleSectionViewController.self
        DemoItem(name: "Storyboard",
                 controllerClass: ViewController.self,//SingleSectionViewController.self
            controllerIdentifier: "demo"),
        DemoItem(name: "Single Section Storyboard",
                 controllerClass: ViewController.self,//SingleSectionStoryboardViewController.self
            controllerIdentifier: "singleSectionDemo"),
        DemoItem(name: "Working Range",
                 controllerClass: ViewController.self),//WorkingRangeViewController.self
        DemoItem(name: "Diff Algorithm",
                 controllerClass: ViewController.self),//DiffTableViewController.self
        DemoItem(name: "Supplementary Views",
                 controllerClass: ViewController.self),//SupplementaryViewController.self
        DemoItem(name: "Self-sizing cells",
                 controllerClass: ViewController.self),//SelfSizingCellsViewController.self
        DemoItem(name: "Display delegate",
                 controllerClass: ViewController.self),//DisplayViewController.self
        DemoItem(name: "Objc Demo",
                 controllerClass: ViewController.self),//ObjcDemoViewController.self
        DemoItem(name: "Objc Generated Model Demo",
                 controllerClass: ViewController.self),//ObjcGeneratedModelDemoViewController.self
        DemoItem(name: "Calendar (auto diffing)",
                 controllerClass: ViewController.self),//CalendarViewController.self
        DemoItem(name: "Dependency Injection",
                 controllerClass: ViewController.self),//AnnouncingDepsViewController.self
        DemoItem(name: "Reorder Cells",
                 controllerClass: ViewController.self)//ReorderableViewController.self
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Demos"
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
