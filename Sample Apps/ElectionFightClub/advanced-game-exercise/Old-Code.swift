//
//  Old-Code.swift
//  advanced-game-exercise
//
//  Created by Mark Hamilton on 2/16/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

/*
*   The following are snippets of code that were refactored or otherwise depracated.
*/

//     var backgroundMusicEnabled: Bool = true
//     var attackMusicEnabled: Bool = true
//     var deathMusicEnabled: Bool = true
//
//enum soundEffects: String {
//    case attack = "attack"
//    case death = "death"
//    case bg = "bg"
//}
//
//    var bgMusic: AVAudioPlayer!
//    var attackMusic: AVAudioPlayer!
//    var deathMusic: AVAudioPlayer!
//
//        prepareSoundToPlay("bg", ofType: "wav")
//        prepareSoundToPlay("attack", ofType: "wav")
//        prepareSoundToPlay("death", ofType: "wav")
//
//    func prepareSoundToPlay(soundName: String, ofType: String) {
//
//        let pathToSound = NSBundle.mainBundle().pathForResource(soundName, ofType: ofType)
//
//        let soundUrl = NSURL(fileURLWithPath: pathToSound!)
//
//        if soundName == "attack" {
//            do {
//                try attackMusic = AVAudioPlayer(contentsOfURL: soundUrl)
//                attackMusic.prepareToPlay()
//            } catch let err as NSError {
//                print(err.debugDescription)
//            }
//        } else if soundName == "bg" {
//            do {
//                try bgMusic = AVAudioPlayer(contentsOfURL: soundUrl)
//                bgMusic.prepareToPlay()
//            } catch let err as NSError {
//                print(err.debugDescription)
//            }
//        } else if soundName == "bg" {
//            do {
//                try bgMusic = AVAudioPlayer(contentsOfURL: soundUrl)
//                bgMusic.prepareToPlay()
//            } catch let err as NSError {
//                print(err.debugDescription)
//            }
//        } else {
//
//            // do nothing
//
//        }
//    }
//
//func playSound(selectedSound: soundEffects) {
//    
//    if selectedSound == soundEffects.attack && attackMusic.isEnabled {
//        
//        // play attack sound
//        attackMusic.play()
//        
//    } else if selectedSound == soundEffects.death && deathMusic.isEnabled {
//        
//        // play death sound
//        deathMusic.play()
//        
//    } else {
//        if bgMusic.isEnabled {
//            
//            // restart background music
//            bgMusic.play()
//            
//        }
//    }
//}
//
//    func toggleSoundEffect(selectedSound: soundEffects) {
//
//        if selectedSound == soundEffects.attack {
//
//            attackMusic.toggle()
//
//        } else if selectedSound == soundEffects.death {
//
//            deathMusic.toggle()
//
//        } else if selectedSound == soundEffects.bg {
//
//            bgMusic.toggle()
//
//        } else {
//
//            // do nothing
//
//        }
//    }
