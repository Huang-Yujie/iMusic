//
//  CustomCollectionCell.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/27.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var songNameLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setUpSubView()
    }
    
    fileprivate func setUpSubView() {
        self.addSubview(imageView)
        self.addSubview(songNameLabel)
        self.addSubview(artistLabel)
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        songNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        songNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        songNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        
        artistLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        artistLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 3).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
