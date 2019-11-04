//
//  PlayerView.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/29.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class PlayerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpViews() {
        self.addSubview(image)
        self.addSubview(songNameLabel)
        self.addSubview(progressSlider)
//        self.addSubview(backwardButton)
//        self.addSubview(forwardButton)
//        self.addSubview(playPauseButton)
//        self.addSubview(volumeSlider)
                
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        songNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        songNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        songNameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        
        progressSlider.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor).isActive = true
        progressSlider.trailingAnchor.constraint(equalTo: songNameLabel.trailingAnchor).isActive = true
        progressSlider.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 60).isActive = true
        
        
    }
    
    let image: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named:"Galway Girl" )
        
        imageView.image = image?.withAlignmentRectInsets(UIEdgeInsets(top: -100, left: -100, bottom: -100, right: -100))

//        imageView.contentMode = .center
//        imageView.largeContentImageInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Galway Girl"
        label.font = UIFont(name: "PingFang-SC-Semibold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .gray
        slider.thumbTintColor = .gray
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let backwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let forwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let playPauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValueImage = UIImage(systemName: "speaker.fill")
        slider.maximumValueImage = UIImage(systemName: "speaker.3.fill")
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
}
