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

class PlayerViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        setBackground()
        setUpCommandCenter()
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
        playView.playPauseButton.addTarget(playback, action: #selector(playback.switchPlayStatus), for: .touchUpInside)
        playView.backwardButton.addTarget(self, action: #selector(lastSong), for: .touchUpInside)
        playView.forwardButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        playback.setVolumeSlider(playView.volumeSlider)
        Timer.scheduledTimer(timeInterval: 0, target: playback!, selector: #selector(playback.setButtonImage(timer:)), userInfo: playView.playPauseButton, repeats: true)
        setUpInfo()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        playback.pause()
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
        viewDidLoad()
    }
    
    @objc func nextSong() {
        playback.pause()
        playback.switchSong(1)
        viewDidLoad()
    }
}
