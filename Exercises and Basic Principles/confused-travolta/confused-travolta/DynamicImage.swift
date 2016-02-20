//
//  DynamicImage.swift
//  confused-travolta
//
//  Created by Mark Hamilton on 2/18/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

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