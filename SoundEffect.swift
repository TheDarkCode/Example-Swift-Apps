//
//  SoundEffect.swift
//  Sample class for quickly incorporating sound effects.
//
//  Created by Mark Hamilton on 2/16/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import AVFoundation

class SoundEffect {
    
    private var _name: String! = "sound"
    private var _ofType: String! = "wav"
    private var _isEnabled: Bool! = true
    private var _loop: Bool! = false
    private var _playing: Bool! = false
    private var _volume: Float! = 1.0
    
    var sound: AVAudioPlayer!
    
    var name: String {
        get {
            return _name
        }
    }
    
    var ofType: String {
        get {
            return _ofType
        }
    }
    
    var isEnabled: Bool {
        get {
            if let enableBool: Bool = _isEnabled {
                return enableBool
            } else {
                return false
            }
        }
    }
    
    var loop: Bool {
        get {
            return _loop
        }
    }
    
    var playing: Bool {
        get {
            if let isPlaying: Bool = sound.playing {
                return isPlaying
            }
            else {
                return _playing
                // return false
            }
        }
    }
    
    var volume: Float {
        get {
            return _volume
        }
    }
    
    init(fileName: String, fileType: String, enableSound: Bool?, enableLooping: Bool?, defaultVolume: Float?) {
        
        self._name = fileName
        self._ofType = fileType
        
        if let setEnable = enableSound {
            self._isEnabled = setEnable
        }
        
        if let looping = enableLooping {
            self._loop = looping
        }
        
        if let setVolume = defaultVolume {
            self._volume = setVolume
        }
    }
    
    func prepareToPlay() {
        
        let path = NSBundle.mainBundle().pathForResource(self.name, ofType: self.ofType)
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            
            try sound = AVAudioPlayer(contentsOfURL: soundUrl)
            
            if loop {
                
                // infinite looping
                sound.numberOfLoops = -1
            }
            
            if volume != 1.0 {
                
                // set to non-default volume level
                sound.volume = volume
            }
            
            sound.prepareToPlay()
            
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
    }
    
    func play() {
        
        if sound.playing {
            sound.stop()
        }
        
        if isEnabled == true {
            sound.play()
        }
    }
    
    func stop() {
        
        if sound.playing {
            sound.stop()
        }
    }
    
    func enable() {
        
        _isEnabled = true
    }
    
    func disable() {
        
        _isEnabled = false
    }
    
    func toggle() {
        
        _isEnabled = !_isEnabled
    }
    
    func setVolume(level: Float) {
        
        if sound.playing {
            sound.volume = level
        }
    }
    
}
