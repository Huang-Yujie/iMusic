//
//  File.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/21.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

let info = ["播放列表", "艺人", "专辑", "歌曲"]
let songs = ["Galway Girl", "Photograph"]

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
        
        self.addSubview(topBar)
        self.addSubview(scroll)
        
        scroll.addSubview(backView)
        
        backView.addSubview(topLabel)
        backView.addSubview(topTable)
        backView.addSubview(label)
        backView.addSubview(collection)
        
        topBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        topBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scroll.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scroll.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scroll.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        backView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: collection.bottomAnchor).isActive = true
        
        topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topLabel.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 10).isActive = true
        
        topTable.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topTable.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topTable.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 4).isActive = true
        topTable.heightAnchor.constraint(equalToConstant: 240).isActive = true

        label.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topTable.bottomAnchor).isActive = true
        
        collection.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18).isActive = true
        collection.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 800).isActive = true
    }
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
//        scroll.contentSize =
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let topBar: UINavigationBar = {
        let bar = UINavigationBar()
        let barButton = UIBarButtonItem()
        barButton.title = "编辑"
        barButton.tintColor = UIColor.red
        bar.isTranslucent = false
        bar.shadowImage = UIImage()
        let barItem = UINavigationItem(title: "资料库")
        bar.items?.append(barItem)
        bar.topItem?.title = "资料库"
        bar.topItem?.rightBarButtonItem = barButton
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "资料库"
        label.textAlignment = .left
        label.font = UIFont.init(name: "PingFang-SC-Semibold", size: 35)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topTable: UITableView = {
        let table = UITableView(frame: CGRect(), style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CustomTableCell.self, forCellReuseIdentifier: "TableCell")
        table.rowHeight = 57
        table.isScrollEnabled = false
        return table
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "最近添加"
        label.textAlignment = .left
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 300)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        
        let collection = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.isScrollEnabled = false
        collection.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        return collection
    }()
}
