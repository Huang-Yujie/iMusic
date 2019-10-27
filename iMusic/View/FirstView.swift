//
//  File.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/21.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

let info = ["播放列表", "艺人", "专辑", "歌曲"]
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
        self.addSubview(topBar)
        self.addSubview(collection)
        
        topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topLabel.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 10).isActive = true
        
        topBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        topBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        topTable.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topTable.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topTable.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10).isActive = true
        topTable.heightAnchor.constraint(equalToConstant: 240).isActive = true

        collection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collection.topAnchor.constraint(equalTo: topTable.bottomAnchor).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    let topBar : UINavigationBar = {
        let bar = UINavigationBar()
        let barButton = UIBarButtonItem()
        barButton.title = "编辑"
        barButton.tintColor = UIColor.red
        bar.isTranslucent = false
        let barItem = UINavigationItem(title: "资料库")
        bar.items?.append(barItem)
        bar.topItem?.title = "资料库"
        bar.topItem?.rightBarButtonItem = barButton
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let topLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "资料库"
        label.textAlignment = .left
        label.font = UIFont.init(name: "PingFang-SC-Semibold", size: 35)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topTable : UITableView = {
        let table = UITableView(frame: CGRect(), style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CustomTableCell.self, forCellReuseIdentifier: "Cell")
        table.rowHeight = 57
        return table
    }()
    
    let collection :UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 200)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 50
        
        let collection = UICollectionView()
        collection.collectionViewLayout = layout
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "Cell")
        return collection
    }()
}
