//
//  CustomCell.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/24.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    var arrowImage: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        arrowImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 12).isActive = true
        arrowImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        arrowImage.image = UIImage(named: "baseline_keyboard_arrow_right_black_18dp")
        self.contentView.addSubview(arrowImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

