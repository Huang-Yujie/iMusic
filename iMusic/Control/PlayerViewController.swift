//
//  PlayerVC.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/29.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit
import MediaPlayer

var playback: Playback!

class PlayerViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.nextTrackCommand.isEnabled = true
        commandCenter.nextTrackCommand.addTarget { [unowned self] event in
            self.nextSong()
            return .success
        }
        
        commandCenter.previousTrackCommand.isEnabled = true
        commandCenter.previousTrackCommand.addTarget { [unowned self] event in
        self.lastSong()
        return .success
        }
        
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget {event in
            playback.switchPlayStatus()
        return .success
        }
        
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget {event in
            playback.switchPlayStatus()
        return .success
        }
    }
    
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
        playView.playPauseButton.addTarget(playback, action: #selector(playback.switchPlayPause(_:)), for: .touchUpInside)
        playView.progressSlider.addTarget(playback, action: #selector(playback.editProgressSlider), for: .valueChanged)
        playView.backwardButton.addTarget(self, action: #selector(lastSong), for: .touchUpInside)
        playView.forwardButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        playback.setVolumeSlider(playView.volumeSlider)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        playback.pause()
    }
    
    @objc func lastSong() {
        playback.pause()
        playback.switchSong(-1)
        viewDidLoad()
    }
    
    @objc func nextSong() {
        playback.pause()
        playback.switchSong(1)
        viewDidLoad()
    }
}
