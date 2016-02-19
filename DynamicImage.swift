//
//  DynamicImage.swift
//  Simple class for quickly adding dynamic UIImageViews to your application.
//  Create a single or array of Animation objects to assign to your DynamicImage.
//
//  Created by Mark Hamilton on 2/17/16. Updated 2/18/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import UIKit

class DynamicImage: UIImageView {

    private var _animation: Animation?
    
    // Uses lots of memory, can crash your app if too many are loaded.
    private var _animations: [Animation]?
    
    var animation: Animation {
        get {
            if let anim = _animation {
                return anim
            } else {
                return Animation()
            }
        }
    }
    
    var animations: [Animation] {
        get {
            if let anims = _animations {
                return anims
            } else {
                return [Animation]()
            }
        }
    }
    
    convenience init(frame: CGRect, defaultAnimation: Animation?, animationArray: [Animation]?) {
        self.init(frame: frame)
        
        if let anim = defaultAnimation {
            self._animation = anim
        }
        
        if let anims = animationArray {
            self._animations = anims
        }
        
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Play animation on load
        playDefaultAnimation()
    }
    
    
    func playRandomAnimation() {
        
        var random: Int = 0
        
        if let count: Int = animations.count {
            
            let rand = arc4random_uniform(UInt32(count))
            random = Int(rand)
            
        }
        
        playCustomAnimation(random)
        
    }
    
    func playDefaultAnimation() {
        
        if let baseImage: UIImage = animation.defaultImage {
            self.image = baseImage
        }
        
        self.animationImages = nil
        
        if let frames: [UIImage] = animation.frames {
            
            self.animationImages = frames
            
        }
        
        if let duration: NSTimeInterval = animation.duration {
            
            self.animationDuration = duration
            
        }
        
        if let toRepeat: Bool = animation.isRepeated {
            
            if toRepeat {
                
                if let repeats: Int = animation.repeatCount {
                    self.animationRepeatCount = repeats
                }
                
            }
            
        }
        
        if self.animationImages != nil {
            self.startAnimating()
        }
        
    }
    
    func playCustomAnimation(selectedAnimation: Int) {
        
        if let baseImage: UIImage = animations[selectedAnimation].defaultImage {
            self.image = baseImage
        }
        
        self.animationImages = nil
        
        if let frames: [UIImage] = animations[selectedAnimation].frames {
            
            self.animationImages = frames
            
        }
        
        if let duration: NSTimeInterval = animations[selectedAnimation].duration {
            
            self.animationDuration = duration
            
        }
        
        if let toRepeat: Bool = animations[selectedAnimation].isRepeated {
            
            if toRepeat {
                
                if let repeats: Int = animations[selectedAnimation].repeatCount {
                    self.animationRepeatCount = repeats
                } else {
                    self.animationRepeatCount = 0
                }
                
            }
            
        }
        
        if self.animationImages != nil {
            self.startAnimating()
        }
        
    }
    
    func unloadAnimations() {
        
        self._animation = Animation()
        self._animations = [Animation]()
        
    }
    
}

class Animation {
    
    private var _id: String! = "Animation"
    
    private var _defaultImage: UIImage! = UIImage()
    
    private var _frames: [UIImage]! = [UIImage]()
    
    private var _duration: NSTimeInterval! = 1.0
    
    private var _isRepeated: Bool! = false
    
    private var _repeatCount: Int! = 0
    
    private var _framePrefix: String! = "frame"
    
    private var _frameCount: Int! = 1
    
    private var _playbackRate: Double! = 1.0
    
    
    var id: String {
        get {
            if let i = _id {
                return i
            } else {
                return "Animation"
            }
        }
    }
    
    var defaultImage: UIImage {
        get {
            if let img = _defaultImage {
                return img
            } else {
                return UIImage()
            }
        }
    }
    
    var frames: [UIImage] {
        get {
            if let frameArray = _frames {
                return frameArray
            } else {
                return [UIImage]()
            }
        }
    }
    
    var duration: NSTimeInterval {
        get {
            if let length = _duration {
                return NSTimeInterval(length * playbackRate)
            } else {
                return 1.0
            }
        }
    }
    
    var isRepeated: Bool {
        get {
            if let repeated = _isRepeated {
                return repeated
            } else {
                return true
            }
        }
    }
    
    var repeatCount: Int {
        get {
            if let count = _repeatCount {
                return count
            } else {
                if isRepeated == true {
                    return 0
                } else {
                    return 1
                }
            }
        }
    }
    
    var framePrefix: String {
        get {
            if let pref = _framePrefix {
                return pref
            } else {
                return ""
            }
        }
    }
    
    var frameCount: Int {
        get {
            if let fTotal = _frameCount {
                return fTotal
            } else {
                return 0
            }
        }
    }
    
    var playbackRate: Double {
        get {
            if let pRate = _playbackRate {
                return pRate
            } else {
                return 1.0
            }
        }
    }
    
    // Empty Initializer
    init() {}
    
    // Pass UIImages to Animation Object
    init(id: String?, baseImage: UIImage?, animationFrames: [UIImage]?, animationDuration: NSTimeInterval?, animationRepeated: Bool?, repeatLimit: Int?) {
        
        
        if let i = id {
            self._id = i
        }
        
        if let base = baseImage {
            self._defaultImage = base
        }
        
        if let frameArray = animationFrames {
            self._frames = frameArray
        }
        
        if let length = animationDuration {
            self._duration = length
        }
        
        if let repeated = animationRepeated {
            self._isRepeated = repeated
        }
        
        if let count = repeatLimit {
            self._repeatCount = count
        }
        
        
    }
    
    // Pass Prefix and Frame Count to Animation Object
    init(id: String?, baseImage: UIImage?, animationFramePrefix: String?, animationFrameCount: Int?, animationDuration: NSTimeInterval?, animationRepeated: Bool?, repeatLimit: Int?) {
        
        
        if let i = id {
            self._id = i
        }
        
        if let base = baseImage {
            self._defaultImage = base
        }
        
        if let animPrefix = animationFramePrefix {
            self._framePrefix = animPrefix
        }
        
        if let frameTotal = animationFrameCount {
            self._frameCount = frameTotal
        }
        
        if let length = animationDuration {
            self._duration = length
        }
        
        if let repeated = animationRepeated {
            self._isRepeated = repeated
        }
        
        if let count = repeatLimit {
            self._repeatCount = count
        }
        
        populateAnimFrames()
        
    }
    
    func changeId(newId: String!) {
        
        if let nId = newId {
            self._id = nId
        }
        
    }
    
    func stopRepeat() {
        
        self._isRepeated = false
        
    }
    
    func newRepeatLimit(newLimit: Int!) {
        
        if let lim = newLimit {
            self._repeatCount = lim
        }
        
    }
    
    func newDuration(newDuration: NSTimeInterval!) {
        
        if let newTime = newDuration {
            self._duration = newTime
        }
        
    }
    
    
    func newPrefix(newPrefix: String!) {
        
        if let newPref = newPrefix {
            self._framePrefix = newPref
        }
        
        populateAllFrames()
        
    }
    
    func newFrameCount(newCount: Int!) {
        
        if let newTotal = newCount {
            self._frameCount = newTotal
        }
        
        populateAllFrames()
        
    }
    
    func populateAllFrames() {
        
        populateAnimFrames()
        
        if let newDefault: UIImage = self._frames[0] {
            self._defaultImage = newDefault
        }
        
    }
    
    func populateAnimFrames() {
        
        if frameCount > 0 && framePrefix != "" {
            
            self._frames = [UIImage]()
            
            for var x = 1; x <= frameCount; x++ {
                self._frames.append(UIImage(named: "\(framePrefix)\(x)")!)
            }
        }
        
    }
    
    func appendFrames(newFrame: UIImage!) {
        
        if let newImage = newFrame {
            self._frames.append(newImage)
        }
        
    }
    
    func removeLastFrame() {
        
        if self.frames.count > 0 {
            self._frames.removeLast()
        }
        
    }
    
    func removeFirstFrame() {
        
        if self.frames.count > 0 {
            self._frames.removeFirst()
        }
        
    }
    
    func removeAllFrames() {
        
        if self.frames.count > 0 {
            self._frames.removeAll()
        }
        
    }
    
    func removeFrameAtIndex(frameIndex: Int!) {
        
        if self.frames.count > 0 {
            
            if let index = frameIndex {
                self._frames.removeAtIndex(index)
            }
            
        }
        
    }
    
    func removeFrame(frameNumber: Int!) {
        
        if self.frames.count > 0 {
            
            if let frameNum = frameNumber {
                
                if frameNum > 0 {
                    self._frames.removeAtIndex((frameNum - 1))
                }
                
            }
            
        }
        
    }
    
    func repeatOnce() {
     
        self._isRepeated = true
        self._repeatCount = 1
        
    }
    
    func adjustPlaybackRate(newRate: Double!) {
        
        if let rate = newRate {
            self._playbackRate = rate
        }
        
    }
}
