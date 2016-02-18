//
//  DynamicImage.swift
//  Simple class for quickly adding dynamic UIImageViews to your application.
//  Create a single or array of Animation objects to assign to your DynamicImage.
//
//  Created by Mark Hamilton on 2/17/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation
import UIKit

class DynamicImage: UIImageView {
    
    var _animation: Animation?
    
    var _animations: [Animation]?
    
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
        
        self._animation = defaultAnimation
        
        self._animations = animationArray
        
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playDefaultAnimation()
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
        
        self.startAnimating()
        
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
        
        self.startAnimating()
        
    }
    
}

class Animation {
    
    var _id: String?
    
    var _defaultImage: UIImage?
    
    var _frames: [UIImage]?
    
    var _duration: NSTimeInterval?
    
    var _isRepeated: Bool?
    
    var _repeatCount: Int?
    
    
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
                return length
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
    
    init() {}
    
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
    
    
}
