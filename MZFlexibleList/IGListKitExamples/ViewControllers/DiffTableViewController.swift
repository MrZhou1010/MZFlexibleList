//
//  DiffTableViewController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit
import IGListKit

final class Person: ListDiffable {
    
    public let pk: Int
    
    public let name: String
    
    public init(pk: Int, name: String) {
        self.pk = pk
        self.name = name
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self.pk as NSNumber
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let obj = object as? Person else {
            return false
        }
        return self.name == obj.name
    }
}

class DiffTableViewController: UITableViewController {
    
    private let oldPeople = [Person(pk: 1, name: "Kevin"),
                     Person(pk: 2, name: "Mike"),
                     Person(pk: 3, name: "Ann"),
                     Person(pk: 4, name: "Jane"),
                     Person(pk: 5, name: "Philip"),
                     Person(pk: 6, name: "Mona"),
                     Person(pk: 7, name: "Tami"),
                     Person(pk: 8, name: "Jesse"),
                     Person(pk: 9, name: "Jaed")]
    
    private let newPeople = [Person(pk: 2, name: "Mike"),
                     Person(pk: 10, name: "Marne"),
                     Person(pk: 5, name: "Philip"),
                     Person(pk: 1, name: "Kevin"),
                     Person(pk: 3, name: "Ryan"),
                     Person(pk: 8, name: "Jesse"),
                     Person(pk: 7, name: "Tami"),
                     Person(pk: 4, name: "Jane"),
                     Person(pk: 9, name: "Chen")]
    
    private lazy var people: [Person] = {
        return self.oldPeople
    }()
    
    private var usingOldPeople = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(onDiff))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    @objc private func onDiff() {
        let from = self.people
        let to = self.usingOldPeople ? self.newPeople : self.oldPeople
        self.usingOldPeople = !self.usingOldPeople
        self.people = to
        let result = ListDiffPaths(fromSection: 0, toSection: 0, oldArray: from, newArray: to, option: .equality).forBatchUpdates()
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: result.deletes, with: .fade)
        self.tableView.insertRows(at: result.inserts, with: .fade)
        result.moves.forEach {
            self.tableView.moveRow(at: $0.from, to: $0.to)
        }
        self.tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = self.people[indexPath.row].name
        return cell
    }
}
