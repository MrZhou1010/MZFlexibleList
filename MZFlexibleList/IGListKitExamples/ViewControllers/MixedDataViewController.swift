//
//  MixedDataViewController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

class MixedDataViewController: UIViewController {
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var data: [Any] = [
        "Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
        GridItem(color: UIColor(red: 237 / 255.0, green: 73 / 255.0, blue: 86 / 255.0, alpha: 1), itemCount: 6),
        User(pk: 2, name: "Ryan Olson", handle: "ryanolsonk"),
        "Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
        User(pk: 4, name: "Oliver Rickard", handle: "ocrickard"),
        GridItem(color: UIColor(red: 56 / 255.0, green: 151 / 255.0, blue: 240 / 255.0, alpha: 1), itemCount: 5),
        "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
        User(pk: 3, name: "Jesse Squires", handle: "jesse_squires"),
        GridItem(color: UIColor(red: 112 / 255.0, green: 192 / 255.0, blue: 80 / 255.0, alpha: 1), itemCount: 3),
        "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
        GridItem(color: UIColor(red: 163 / 255.0, green: 42 / 255.0, blue: 186 / 255.0, alpha: 1), itemCount: 7),
        User(pk: 1, name: "Ryan Nystrom", handle: "_ryannystrom")
    ]
    
    private let segments: [(String, Any.Type?)] = [
        ("All", nil),
        ("Colors", GridItem.self),
        ("Text", String.self),
        ("Users", User.self)
    ]
    
    private var selectedClass: Any.Type?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let control = UISegmentedControl(items: self.segments.map {
            return $0.0
        })
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onControl(_:)), for: .valueChanged)
        self.navigationItem.titleView = control
        if #available(iOS 9.0, *) {
            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongGesture(gesture:)))
            self.collectionView.addGestureRecognizer(longPressGesture)
        }
        self.collectionView.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView)
        self.adapter.dataSource = self
        self.adapter.collectionView = self.collectionView
        if #available(iOS 9.0, *) {
            self.adapter.moveDelegate = self
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }
    
    @available(iOS 9.0, *)
    @objc private func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            let touchLocation = gesture.location(in: self.collectionView)
            guard let selectedIndexPath = self.collectionView.indexPathForItem(at: touchLocation) else {
                break
            }
            self.collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            if let view = gesture.view {
                let position = gesture.location(in: view)
                self.collectionView.updateInteractiveMovementTargetPosition(position)
            }
        case .ended:
            self.collectionView.endInteractiveMovement()
        default:
            self.collectionView.cancelInteractiveMovement()
        }
    }
    
    @objc private func onControl(_ control: UISegmentedControl) {
        self.selectedClass = self.segments[control.selectedSegmentIndex].1
        self.adapter.performUpdates(animated: true, completion: nil)
    }
}

// MARK: - ListAdapterDataSource
extension MixedDataViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard self.selectedClass != nil else {
            return self.data.map {
                $0 as! ListDiffable
            }
        }
        return self.data.filter {
            // 过滤数据
            type(of: $0) == self.selectedClass!
        }.map {
            $0 as! ListDiffable
        }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is String:
            return ExpandableSectionController()
        case is GridItem:
            return GridSectionController(isReorderable: true)
        default:
            return UserSectionController(isReorderable: true)
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MARK: - ListAdapterMoveDelegate
extension MixedDataViewController: ListAdapterMoveDelegate {
    func listAdapter(_ listAdapter: ListAdapter, move object: Any, from previousObjects: [Any], to objects: [Any]) {
        self.data = objects
    }
}
