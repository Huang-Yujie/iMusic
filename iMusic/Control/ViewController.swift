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
                
        
//        fisrtVC.tabBarItem.image = UIImage(named: "FirstVCDeselected")
//        fisrtVC.tabBarItem.selectedImage = UIImage(named: "FirstVCSelected")
//        secondVC.tabBarItem.image = UIImage(named: "SecondVCDeselected")
//        secondVC.tabBarItem.selectedImage = UIImage(named: "SecondVCSelected")
//        thirdVC.tabBarItem.image = UIImage(named: "ThirdVCDeselected")
//        thirdVC.tabBarItem.selectedImage = UIImage(named: "ThirdVCSelected")
        
//        fisrtVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
//        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
//        thirdVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        self.viewControllers = [libraryViewController, forYouViewController, browseViewController, radioViewController, searchViewController]
        
    }
    
    
}
