//
//  ViewController.swift
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/3.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "MZFlexibleList"
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.btn)
    }
    
    private lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 200, width: 100, height: 30)
        btn.setTitle("微信朋友圈", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    
    @objc private func btnClicked(btn: UIButton) {
        // let momentsVC = MZMomentsVC()
        let momentsVC = DemosViewController()
        momentsVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(momentsVC, animated: true)
    }
}

