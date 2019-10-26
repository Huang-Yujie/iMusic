//
//  ViewController.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/21.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        // Do any additional setup after loading the view.
//    }
//
//    let mainView = FirstView()
//
//    private func setupViews(){
//
//        view.addSubview(mainView)
//
//        mainView.translatesAutoresizingMaskIntoConstraints = false
//        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//    }
//}

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        setUpTabBar()
        setUpVC()
        self.selectedIndex = 0
        
    }
    
    fileprivate func setUpTabBar(){

//        let screenWidth = view.frame.width
//        let rect = CGRect(x:0,y:0,width:screenWidth,height:0.5)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()!
//        context.setFillColor(UIColor.red.cgColor)
//        context.fill(rect)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        self.tabBar.shadowImage = image
//        self.tabBar.backgroundImage = UIImage()
        
//        self.tabBar.backgroundColor = UIColor.white

    }
    
    fileprivate func setUpVC(){
        let firstVC = FirstVC()
        let secondVC = SecondVC()
        let thirdVC = ThirdVC()
        let fourthVC = FourthVC()
        let fifthVC = FifthVC()
        
        firstVC.tabBarItem.title = "资料库"
        secondVC.tabBarItem.title = "为你推荐"
        thirdVC.tabBarItem.title = "浏览"
        fourthVC.tabBarItem.title = "广播"
        fifthVC.tabBarItem.title = "搜索"
        
        firstVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
        secondVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
        thirdVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
        fourthVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
        fifthVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)

        
        
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
