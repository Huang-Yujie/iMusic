//
//  SubViewController.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/11/4.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class SubviewController: UIViewController {
    
    var viewControllerTitle: String?
    
    init(_ viewControllerTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerTitle = viewControllerTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = viewControllerTitle
    }
}
