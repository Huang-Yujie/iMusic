//
//  ViewController.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/21.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = true
        self.tabBar.alpha = 0.8
        self.tabBar.tintColor = .red
        setUpVC()
        self.selectedIndex = 0
        
    }
    
    fileprivate func setUpVC(){
        let libraryViewController = LibraryViewController(rootViewController: LibraryRootViewController())
        let forYouViewController = ForYouViewController()
        let browseViewController = BrowseViewController()
        let radioViewController = RadioViewController()
        let searchViewController = SearchViewController()
        
        libraryViewController.tabBarItem.title = "资料库"
        forYouViewController.tabBarItem.title = "为你推荐"
        browseViewController.tabBarItem.title = "浏览"
        radioViewController.tabBarItem.title = "广播"
        searchViewController.tabBarItem.title = "搜索"
                
        self.viewControllers = [libraryViewController, forYouViewController, browseViewController, radioViewController, searchViewController]
        
    }
    
    
}
