//
//  File.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/21.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class LibraryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubViews(){
        self.backgroundColor = .white
        
        self.addSubview(backView)
        
        backView.addSubview(topLabel)
        backView.addSubview(topTable)
        backView.addSubview(label)
        backView.addSubview(collection)
        backView.addSubview(playBar)
        
        playBar.addSubview(imageView)
        playBar.addSubview(songNameLabel)
        playBar.addSubview(playPauseButton)
        playBar.addSubview(forwardButton)
        
        backView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
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
        collection.bottomAnchor.constraint(equalTo: playBar.topAnchor).isActive = true
        
        playBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        playBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        playBar.heightAnchor.constraint(equalToConstant: 65).isActive = true
        playBar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        imageView.topAnchor.constraint(equalTo: playBar.topAnchor, constant: 10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: playBar.bottomAnchor, constant: -10).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        
        songNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
        songNameLabel.centerYAnchor.constraint(equalTo: playBar.centerYAnchor).isActive = true
        
        forwardButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18).isActive = true
        forwardButton.centerYAnchor.constraint(equalTo: playBar.centerYAnchor).isActive = true
        forwardButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        forwardButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        playPauseButton.trailingAnchor.constraint(equalTo: forwardButton.leadingAnchor, constant: -25).isActive = true
        playPauseButton.centerYAnchor.constraint(equalTo: playBar.centerYAnchor).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        playPauseButton.widthAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
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
        layout.itemSize = CGSize(width: 180, height: 235)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        
        let collection = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        return collection
    }()
    
    let playBar: UIView = {
        let bar = UIView()
        bar.tintColor = .white
        bar.isOpaque = false
        bar.alpha = 0.8
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "nil")
        imageView.image = image
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 2, height: 5)
        imageView.layer.shadowOpacity = 0.2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.text = "未在播放"
        label.font = UIFont(name: "PingFang-SC-Middle", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let playPauseButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let forwardButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

}
