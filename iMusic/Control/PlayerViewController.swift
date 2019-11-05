//
//  PlayerVC.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/29.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var playback: Playback!
    
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
            playback = try Playback(contentsOf: Bundle.main.url(forResource: "Galway Girl", withExtension: "mp3")!)
            playback.setProgressSlider(playView.progressSlider)
            playView.playPauseButton.addTarget(self, action: #selector(switchPlayPause(_:)), for: .touchUpInside)
            playback.setVolumeSlider(playView.volumeSlider)
        } catch {print("Error")}
    }
    
    @objc func switchPlayPause(_ button: UIButton) {
        playback.switchPlayStatus()
        playback.switchButtonImage(button)
    }
}
