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
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .red
        setUpVC()
        self.selectedIndex = 0
        
    }
    
    fileprivate func setUpVC(){
        let firstVC = FirstVC(rootViewController: FirstRootVC())
        let secondVC = SecondVC()
        let thirdVC = ThirdVC()
        let fourthVC = FourthVC()
        let fifthVC = FifthVC()
        
        firstVC.tabBarItem.title = "资料库"
        secondVC.tabBarItem.title = "为你推荐"
        thirdVC.tabBarItem.title = "浏览"
        fourthVC.tabBarItem.title = "广播"
        fifthVC.tabBarItem.title = "搜索"
                
        
//        fisrtVC.tabBarItem.image = UIImage(named: "FirstVCDeselected")
//        fisrtVC.tabBarItem.selectedImage = UIImage(named: "FirstVCSelected")
//        secondVC.tabBarItem.image = UIImage(named: "SecondVCDeselected")
//        secondVC.tabBarItem.selectedImage = UIImage(named: "SecondVCSelected")
//        thirdVC.tabBarItem.image = UIImage(named: "ThirdVCDeselected")
//        thirdVC.tabBarItem.selectedImage = UIImage(named: "ThirdVCSelected")
        
//        fisrtVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
//        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
//        thirdVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        self.viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
        
    }
    
    
}
