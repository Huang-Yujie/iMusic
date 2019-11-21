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
        self.addSubview(artistLabel)
        self.addSubview(progressSlider)
        self.addSubview(timeDidPlayLabel)
        self.addSubview(timeWillPlayLabel)
        self.addSubview(backwardButton)
        self.addSubview(forwardButton)
        self.addSubview(playPauseButton)
        self.addSubview(volumeSlider)
        
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: image.widthAnchor).isActive = true
        
        songNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        songNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        songNameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        
        artistLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        artistLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor).isActive = true
        
        progressSlider.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor).isActive = true
        progressSlider.trailingAnchor.constraint(equalTo: songNameLabel.trailingAnchor).isActive = true
        progressSlider.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 60).isActive = true
        
        timeDidPlayLabel.topAnchor.constraint(equalTo: progressSlider.bottomAnchor, constant: 5).isActive = true
        timeDidPlayLabel.leadingAnchor.constraint(equalTo: progressSlider.leadingAnchor).isActive = true
        timeDidPlayLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -100).isActive = true
        
        timeWillPlayLabel.topAnchor.constraint(equalTo: timeDidPlayLabel.topAnchor).isActive = true
        timeWillPlayLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 100).isActive = true
        timeWillPlayLabel.trailingAnchor.constraint(equalTo: progressSlider.trailingAnchor).isActive = true
        
        playPauseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        playPauseButton.centerYAnchor.constraint(equalTo: progressSlider.bottomAnchor, constant: 80).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        playPauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        backwardButton.centerYAnchor.constraint(equalTo: playPauseButton.centerYAnchor).isActive = true
        backwardButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -UIScreen.main.bounds.width/4).isActive = true
        backwardButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backwardButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        forwardButton.centerYAnchor.constraint(equalTo: playPauseButton.centerYAnchor).isActive = true
        forwardButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width/4).isActive = true
        forwardButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        forwardButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        volumeSlider.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor).isActive = true
        volumeSlider.trailingAnchor.constraint(equalTo: songNameLabel.trailingAnchor).isActive = true
        volumeSlider.topAnchor.constraint(equalTo: playPauseButton.bottomAnchor, constant: 60).isActive = true
    }
    
    let image: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: Current.songName)
        
        imageView.image = image?.withAlignmentRectInsets(UIEdgeInsets(top: -70, left: -70, bottom: -70, right: -70))
        imageView.layer.cornerRadius = 12
//        imageView.layer.shadowColor = UIColor.black.cgColor
//        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
//        imageView.layer.shadowOpacity = 0.4
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.text = Current.songName
        label.font = UIFont(name: "PingFang-SC-Semibold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.text = Current.artist
        label.textColor = .red
        label.font = UIFont(name: "PingFang-SC-Light", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .lightGray
        slider.thumbTintColor = .lightGray
        let newImage = slider.thumbImage(for: .normal)!.generateNewImage(scaledToSize: CGSize(width: 5, height: 5))
        slider.setThumbImage(newImage, for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.isContinuous = false
        return slider
    }()
    
    let timeDidPlayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeWillPlayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backwardButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
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
    
    let playPauseButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.7
        slider.minimumValueImage = UIImage(systemName: "speaker.fill")
        slider.maximumValueImage = UIImage(systemName: "speaker.3.fill")
        slider.tintColor = .lightGray
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
}
