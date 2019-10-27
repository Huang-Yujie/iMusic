//
//  CustomCollectionCell.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/27.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setUpSubView()
    }
    
    fileprivate func setUpSubView() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
