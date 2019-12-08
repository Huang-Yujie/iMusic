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
var beginPlay = false
var buttonTimer: Timer!
var commandCenter: MPRemoteCommandCenter!
class PlayerViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .formSheet
        
        setBackground()
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        commandCenter = MPRemoteCommandCenter.shared()
        setUpCommandCenter()
        
        updateAll()
    }
    
    private func reset() {
        playback.pause()
        buttonTimer.invalidate()
        volumeTimer.invalidate()
        lockTimer.invalidate()

        libraryView.playPauseButton.removeTarget(playback, action: #selector(playback.switchPlayStatus), for: .touchUpInside)
        libraryView.forwardButton.removeTarget(playback, action: #selector(playback.nextSong), for: .touchUpInside)
        
        
    }
        
    func updateAll() {
        playerView = PlayerView()
        view.addSubview(playerView)
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        playerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        if beginPlay {
            reset()
        }
        
        do {playback = try Playback(contentsOf: Bundle.main.url(forResource: Current.songName, withExtension: "mp3")!)} catch {}
        
        if !beginPlay {
//            libraryView.imageView.isUserInteractionEnabled = true
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popPlayerViewController))
//            tapGesture.numberOfTouchesRequired = 1
//            tapGesture.numberOfTapsRequired = 1
//            libraryView.imageView.addGestureRecognizer(tapGesture)

            beginPlay = true
        }
        
        playback.setProgressSlider(playerView.progressSlider)
        playback.updateDidPlayTimeLabel(playerView.timeDidPlayLabel)
        playback.updateWillPlayTimeLabel(playerView.timeWillPlayLabel)
        playerView.playPauseButton.addTarget(playback, action: #selector(playback.switchPlayStatus), for: .touchUpInside)
        playerView.backwardButton.addTarget(playback, action: #selector(playback.lastSong), for: .touchUpInside)
        playerView.forwardButton.addTarget(playback, action: #selector(playback.nextSong), for: .touchUpInside)
        playback.setVolumeSlider(playerView.volumeSlider)
        Timer.scheduledTimer(timeInterval: 0, target: playback!, selector: #selector(playback.setButtonImage(timer:)), userInfo: playerView.playPauseButton, repeats: true)

//        playerView.imageView.isUserInteractionEnabled = true
//        let swipeLeftGesture = UISwipeGestureRecognizer(target: playback, action: #selector(playback.nextSong))
//        swipeLeftGesture.direction = .left
//        let swipeRightGesture = UISwipeGestureRecognizer(target: playback, action: #selector(playback.lastSong))
//        swipeRightGesture.direction = .right
//        playerView.imageView.addGestureRecognizer(swipeLeftGesture)
//        playerView.imageView.addGestureRecognizer(swipeRightGesture)
        
        libraryRootViewController.updatePlayerBar()

        setUpInfo()

    }
    
    private func setUpCommandCenter() {
        
        commandCenter.nextTrackCommand.isEnabled = true
        commandCenter.nextTrackCommand.addTarget {event in
            playback.switchSong(1)
            self.updateAll()
            return .success
        }
        
        commandCenter.previousTrackCommand.isEnabled = true
        commandCenter.previousTrackCommand.addTarget {event in
            playback.switchSong(-1)
            self.updateAll()
            return .success
        }
        
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget {event in
            playback.play()
            return .success
        }
        
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget {event in
            playback.pause()
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
//        print(Current.songName!)
//        print(Current.artist!)
    }
}
