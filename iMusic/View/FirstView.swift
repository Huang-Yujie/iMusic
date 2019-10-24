//
//  File.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/21.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class FirstView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubViews(){
        self.backgroundColor = .white
        
//        self.addSubview(topButton)
        self.addSubview(topLabel)
        self.addSubview(topTable)
        
        topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    let topBar : UINavigationBar = {
        let bar = UINavigationBar()
        
        return bar
    }()
    let topButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("编辑", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "PingFang-SC-Semibold", size: 18.3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let topLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "资料库"
        label.textAlignment = .left
        label.font = UIFont.init(name: "PingFang-SC-Semibold", size: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topTable : UITableView = {
        let table = UITableView(frame: CGRect(), style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        table.allowsSelection = true
        table.allowsMultipleSelection = false
        table.rowHeight = 44
//        table.sectionFooterHeight = 0
//        table.sectionHeaderHeight = 19
        return table
    }()
    
}
