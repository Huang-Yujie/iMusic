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
        
        do {playback = try Playback(contentsOf: Bundle.main.url(forResource: Current.songName, withExtension: "mp3")!)} catch {}
        playback.setProgressSlider(playView.progressSlider)
        playback.updateDidPlayTimeLabel(playView.timeDidPlayLabel)
        playback.updateWillPlayTimeLabel(playView.timeWillPlayLabel)
        playView.playPauseButton.addTarget(self, action: #selector(switchPlayPause(_:)), for: .touchUpInside)
        playView.progressSlider.addTarget(playback, action: #selector(playback.editProgressSlider), for: .valueChanged)
        playView.backwardButton.addTarget(self, action: #selector(switchSong(_:)), for: .touchUpInside)
        playView.forwardButton.addTarget(self, action: #selector(switchSong(_:)), for: .touchUpInside)
        playback.setVolumeSlider(playView.volumeSlider)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        playback.pause()
    }
        
    @objc func switchPlayPause(_ button: UIButton) {
        playback.switchPlayStatus()
        playback.switchButtonImage(button)
    }
    
    @objc func switchSong(_ button: UIButton) {
        Current.index += button.tag
        if Current.index == songs.count
        {
            Current.index = 0
        }
        if Current.index == -1
        {
            Current.index = songs.count - 1
        }
        playback.pause()
        viewDidLoad()
    }
}
