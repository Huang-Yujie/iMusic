//
//  PlayerVC.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/29.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

var playback: Playback!

class PlayerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .formSheet
        
        let playView = PlayerView()
        view.addSubview(playView)
        playView.translatesAutoresizingMaskIntoConstraints = false
        playView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        playView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        playView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        do {
            playback = try Playback(contentsOf: Bundle.main.url(forResource: Current.songName, withExtension: "mp3")!)
            playback.setProgressSlider(playView.progressSlider)
            playView.playPauseButton.addTarget(self, action: #selector(switchPlayPause(_:)), for: .touchUpInside)
            playView.progressSlider.addTarget(self, action: #selector(editProgress), for: .valueChanged)
            playback.setVolumeSlider(playView.volumeSlider)
        } catch {print("Error")}
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        playback.pause()
    }
        
    @objc func editProgress() {
        playback.editProgressSlider()
    }
    
    @objc func switchPlayPause(_ button: UIButton) {
        playback.switchPlayStatus()
        playback.switchButtonImage(button)
    }
}
