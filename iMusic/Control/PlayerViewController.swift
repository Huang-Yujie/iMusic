//
//  PlayerVC.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/29.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

var playback: Playback!
var playerView: PlayerView!

class PlayerViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .formSheet
        
        setBackground()
        setUpCommandCenter()
        
        updateAll()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        playback.pause()
    }
    
    private func updateAll() {
        playerView = PlayerView()
        view.addSubview(playerView)
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        playerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        do {playback = try Playback(contentsOf: Bundle.main.url(forResource: Current.songName, withExtension: "mp3")!)} catch {}
        
        playback.setProgressSlider(playerView.progressSlider)
        playback.updateDidPlayTimeLabel(playerView.timeDidPlayLabel)
        playback.updateWillPlayTimeLabel(playerView.timeWillPlayLabel)
        playerView.playPauseButton.addTarget(playback, action: #selector(playback.switchPlayStatus), for: .touchUpInside)
        playerView.backwardButton.addTarget(self, action: #selector(lastSong), for: .touchUpInside)
        playerView.forwardButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        playback.setVolumeSlider(playerView.volumeSlider)
        Timer.scheduledTimer(timeInterval: 0, target: playback!, selector: #selector(playback.setButtonImage(timer:)), userInfo: playerView.playPauseButton, repeats: true)
        setUpInfo()

        libraryView.songNameLabel.text = Current.songName
        libraryView.imageView.image = UIImage(named: Current.songName)
    }
    
    private func setUpCommandCenter() {
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
    
    private func setBackground() {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(AVAudioSession.Category.playback)
        try? session.setActive(true)
    }
    
    private func setUpInfo() {
        var info = Dictionary <String, Any>()
        info[MPMediaItemPropertyTitle] = Current.songName
        info[MPMediaItemPropertyArtist] = Current.artist
        let image = UIImage(named: Current.songName)!
        info[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size, requestHandler: { _ in image})
        info[MPMediaItemPropertyPlaybackDuration] = playback.duration
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }
    
    @objc func lastSong() {
        playback.pause()
        playback.switchSong(-1)
        updateAll()
    }
    
    @objc func nextSong() {
        playback.pause()
        playback.switchSong(1)
        updateAll()
    }
}
