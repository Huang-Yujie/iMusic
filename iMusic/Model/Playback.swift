//
//  Playback.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/29.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import AVFoundation
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
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgress), userInfo: nil, repeats: true)
        slider.maximumValue = Float(self.duration)
    }
    
    @objc func updateAudioProgress() {
        if self.isPlaying {
            progressSlider.setValue(Float(self.currentTime), animated: true)
        }
    }
    
    func setVolumeSlider(_ slider: UISlider) {
        volumeSlider = slider
        Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(updateVolume), userInfo: nil, repeats: true)
    }
    
    @objc func updateVolume() {
        self.volume = volumeSlider.value
    }
    
    func switchPlayStatus() {
        if self.isPlaying
        {
            self.pause()
        }
        else
        {
            self.play()
        }
    }
    
    func switchButtonImage(_ button: UIButton) {
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
