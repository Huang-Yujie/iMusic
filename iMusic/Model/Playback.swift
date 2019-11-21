//
//  Playback.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/29.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import AVFoundation
import MediaPlayer
import UIKit

class Playback: AVAudioPlayer {
    
    override init(contentsOf url: URL, fileTypeHint utiString: String?) throws {
        try super.init(contentsOf: url, fileTypeHint: utiString)
    }
    
    override init(contentsOf url: URL) throws {
        try super.init(contentsOf: url)
        self.prepareToPlay()
        self.play()
        self.numberOfLoops = -1
        self.volume = 1
    }
    
    var progressSlider: UISlider!
    var volumeSlider: UISlider!
    
    func setProgressSlider(_ slider: UISlider) {
        progressSlider = slider
        slider.maximumValue = Float(self.duration)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateAudioProgress), userInfo: nil, repeats: true)
        slider.addTarget(self, action: #selector(editProgressSlider), for: .valueChanged)
        slider.addTarget(self, action: #selector(pause), for: .touchDragInside)
    }
    
    @objc func updateAudioProgress() {
        if self.isPlaying {
            progressSlider.setValue(Float(self.currentTime), animated: true)
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPNowPlayingInfoPropertyElapsedPlaybackTime] = currentTime
    }
    
    @objc func editProgressSlider() {
        self.currentTime = TimeInterval(exactly: progressSlider.value)!
        play()
    }
    
    func updateDidPlayTimeLabel(_ label: UILabel) {
        Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(translateDidPlayTimeLabel), userInfo: label, repeats: true)
    }
    
    func updateWillPlayTimeLabel(_ label: UILabel) {
        Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(translateWillPlayTimeLabel), userInfo: label, repeats: true)
    }
    
    @objc func translateDidPlayTimeLabel(timer: Timer) {
        let label = timer.userInfo as! UILabel
        let time = self.currentTime
        let timeInt = Int(time)
        let minute = timeInt / 60
        let second = timeInt % 60
        label.text = String(format: "%d:%02d", minute, second)
    }
    
    @objc func translateWillPlayTimeLabel(timer: Timer) {
        let label = timer.userInfo as! UILabel
        let time = self.duration - self.currentTime
        let timeInt = Int(time)
        let minute = timeInt / 60
        let second = timeInt % 60
        label.text = String(format: "-%d:%02d", minute, second)
    }
        
    func setVolumeSlider(_ slider: UISlider) {
        volumeSlider = slider
        Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(updateVolume), userInfo: nil, repeats: true)
    }
    
    @objc func updateVolume() {
        self.volume = volumeSlider.value
    }
    
    func switchSong(_ flag: Int) {
        Current.index += flag
        if Current.index == -1
        {
            Current.index = songs.count - 1
        }
        if Current.index == songs.count
        {
            Current.index = 0
        }
    }
    
    @objc func switchPlayStatus() {
        if self.isPlaying
        {
            self.pause()
        }
        else
        {
            self.play()
        }
    }
    
    @objc func setButtonImage(timer: Timer) {
        let button = timer.userInfo as! UIButton
        if self.isPlaying
        {
            button.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        else
        {
            button.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
}
