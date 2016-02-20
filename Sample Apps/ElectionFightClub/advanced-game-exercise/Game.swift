//
//  Game.swift
//  advanced-game-exercise
//
//  Created by Mark Hamilton on 2/16/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import AVFoundation

class Game: ViewController {
    
    @IBOutlet weak var mainTextLbl: UILabel!
    @IBOutlet weak var playerOneHpLbl: UILabel!
    @IBOutlet weak var playerTwoHpLbl: UILabel!
    
    @IBOutlet weak var playerOneFist: UIImageView!
    @IBOutlet weak var playerTwoFist: UIImageView!
    
    @IBOutlet weak var playerOneImg: UIImageView!
    @IBOutlet weak var playerTwoImg: UIImageView!
    
    @IBOutlet weak var playerOneAttackBtn: UIButton!
    @IBOutlet weak var playerTwoAttackBtn: UIButton!
    
    @IBOutlet weak var countdownImg: UIImageView!
    
    // Candidate Selectors
    @IBOutlet weak var selectTrumpBtn: UIButton!
    @IBOutlet weak var selectBernieBtn: UIButton!
    @IBOutlet weak var selectCruzBtn: UIButton!
    @IBOutlet weak var selectClintonBtn: UIButton!
    @IBOutlet weak var selectCarsonBtn: UIButton!
    @IBOutlet weak var selectRubioBtn: UIButton!
    
    @IBOutlet weak var resetGameBtn: UIButton!
    @IBOutlet weak var playerOneLootBtn: UIButton!
    @IBOutlet weak var playerTwoLootBtn: UIButton!
    
    // Sound Effects
    var bgMusic: SoundEffect = SoundEffect(fileName: "The_United_States_Army_Old_Guard_Fife_and_Drum_Corps_-_16_-_Drum_Feature_Generations_from_the_Simple_Gifts_Show", fileType: "mp3", enableSound: true, enableLooping: true, defaultVolume: 0.2)
    var attackMusic: SoundEffect = SoundEffect(fileName: "realisticpunch", fileType: "mp3", enableSound: true, enableLooping: false)
    var deathMusic: SoundEffect = SoundEffect(fileName: "nomercy", fileType: "mp3", enableSound: true, enableLooping: false)
    
    var launchMusic: SoundEffect!
    
    var tickEffect: SoundEffect = SoundEffect(fileName: "tick", fileType: "mp3", enableSound: true, enableLooping: false)
    
    var loudBang: SoundEffect = SoundEffect(fileName: "loudbang", fileType: "mp3", enableSound: true, enableLooping: false, defaultVolume: 0.5)
    
    var fightStartSound: SoundEffect = SoundEffect(fileName: "Fight", fileType: "wav", enableSound: true, enableLooping: false)
    
    // Trump Sounds
    var trumpAttacks: [SoundEffect] = [SoundEffect(fileName: "china", fileType: "mp3", enableSound: true, enableLooping: false), SoundEffect(fileName: "lovechina", fileType: "mp3", enableSound: true, enableLooping: false), SoundEffect(fileName: "getgoin", fileType: "mp3", enableSound: true, enableLooping: false), SoundEffect(fileName: "wonthapp", fileType: "mp3", enableSound: true, enableLooping: false), SoundEffect(fileName: "tellu", fileType: "mp3", enableSound: true, enableLooping: false), SoundEffect(fileName: "notnice", fileType: "mp3", enableSound: true, enableLooping: false), SoundEffect(fileName: "happ", fileType: "mp3", enableSound: true, enableLooping: false), SoundEffect(fileName: "troub-4", fileType: "mp3", enableSound: true, enableLooping: false)]
    
    // Give Custom View on First Load
    var isFirstLoad: Bool = true
    var fightIsOn: Bool = false
    
    // Manage Victory
    var lootChestVisible: Bool = false
    var randomLootEnabled: Bool = true
    
    // Players
    var playerOne: Player! = Trump()
    var playerTwo: Player! = Trump()
    
    // Text
    var lootMessage: String?
    var deathMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareAndPlayLaunchMusic()
        
        prepareGameMusic()
        
        NSTimer.scheduledTimerWithTimeInterval(3.5, target: self, selector: "startBackgroundMusic", userInfo: nil, repeats: false)
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "fightCountdown", userInfo: nil, repeats: false)

    }
    
    func randomizeLaunchMusic() -> [String]? {
        
        var selectedLaunchSound: [String]
        
        let rand = Int(arc4random_uniform(UInt32(trumpAttacks.count)))
        
        selectedLaunchSound = [trumpAttacks[rand].name, trumpAttacks[rand].ofType]
        
        return selectedLaunchSound
        
    }
    
    func prepareAndPlayLaunchMusic() {
        
        if let randomMusic = randomizeLaunchMusic() {
            launchMusic = SoundEffect(fileName: randomMusic[0], fileType: randomMusic[1], enableSound: true, enableLooping: false)
        }
    
        launchMusic.prepareToPlay()
        
        launchMusic.play()
    
    }
    
    func prepareGameMusic() {
        
        bgMusic.prepareToPlay()
        attackMusic.prepareToPlay()
        deathMusic.prepareToPlay()
        tickEffect.prepareToPlay()
        loudBang.prepareToPlay()
        fightStartSound.prepareToPlay()
        
        for trumps in trumpAttacks {
            trumps.prepareToPlay()
        }
        
    }
    
    func startBackgroundMusic() {
        bgMusic.play()
        launchMusic.stop()
    }

    func stopAllSounds() {
        
        launchMusic.stop()
        attackMusic.stop()
        deathMusic.stop()
        bgMusic.stop()
        
    }
    
    func fightCountdown() {
        
        if let gameReset: Bool = resetHp() {
            fightIsOn = !gameReset
            hideAttackButtons()
        }
        
        countdownImg.hidden = false
        
        if countdownImg.image != UIImage(named: "Ready-Your-Vote") {
            resetCountdown()
        }
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countToThree", userInfo: nil, repeats: false)
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "countToTwo", userInfo: nil, repeats: false)
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "countToOne", userInfo: nil, repeats: false)
        
        NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, selector: "countToZero", userInfo: nil, repeats: false)
    }
    
    func countToThree() {
        countdownImg.image = UIImage(named: "three")
        tickEffect.play()
    }
    
    func countToTwo() {
        countdownImg.image = UIImage(named: "two")
        tickEffect.play()
    }
    
    func countToOne() {
        countdownImg.image = UIImage(named: "one")
        tickEffect.play()
    }
    
    func countToZero() {
        countdownImg.image = UIImage(named: "Inaugurate")
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "hideCountdown", userInfo: nil, repeats: false)
        
        fightStartSound.play()
        
        startFight()
    }
    
    func startFight() {
        
        fightIsOn = true
        showAttackButtons()
    }
    
    func showAttackButtons() {
        showPlayerOneAttackBtn()
        showPlayerTwoAttackBtn()
    }
    
    func hideAttackButtons() {
        playerOneAttackBtn.hidden = true
        playerTwoAttackBtn.hidden = true
    }
    
    func resetCountdown() {
        countdownImg.image = UIImage(named: "Ready-Your-Vote")
    }
    
    func hideCountdown() {
        countdownImg.hidden = true
    }
    
    func attemptTrumpAttack(targetPlayer: Int) {
        let rand = Int(arc4random_uniform(UInt32(trumpAttacks.count)))
        
        trumpAttacks[rand].play()
        attackMusic.play()
        
        showFist(targetPlayer)
        
        if targetPlayer == 1 {
            if let attackPwr: Int = playerTwo.attackPower {
                playerOne.attemptAttack(attackPwr)
                if let playerHp: Int = playerOne.hp {
                    playerOneHpLbl.text = "\(playerHp) HP"
                    if playerHp <= 80 && playerHp >= 51 {
                        
                        delayAttack(targetPlayer)
                        // slightly roughed up
                        playerOneImg.image = UIImage(named: "donald-trump-standing2")
                        
                    } else if playerHp <= 50 && playerHp > 0 {
                        
                        delayAttack(targetPlayer)
                        // very hurt
                        playerOneImg.image = UIImage(named: "donald-trump-standing3")
                        
                    } else if playerHp <= 0 {
                        
                        playerOneImg.hidden = true
                        declareWinner(2)
                    }
                }
            }
        } else if targetPlayer == 2 {
            if let attackPwr: Int = playerOne.attackPower {
                playerTwo.attemptAttack(attackPwr)
                if let playerHp: Int = playerTwo.hp {
                    playerTwoHpLbl.text = "\(playerHp) HP"
                    if playerHp <= 80 && playerHp >= 51 {
                        
                        delayAttack(targetPlayer)
                        // slightly roughed up
                        playerTwoImg.image = UIImage(named: "donald-trump-standing2-flipped")
                        
                    } else if playerHp <= 50 && playerHp > 0 {
                        
                        delayAttack(targetPlayer)
                        // very hurt
                        playerTwoImg.image = UIImage(named: "donald-trump-standing3-flipped")
                        
                    } else if playerHp <= 0 {
                        
                        playerTwoImg.hidden = true
                        declareWinner(1)
                    }
                }
            }
        }
    }
    
    @IBAction func playerOneAttackBtnPressed(sender: AnyObject) {
        attemptTrumpAttack(2)
    }
    
    @IBAction func playerTwoAttackBtnPressed(sender: AnyObject) {
        attemptTrumpAttack(1)
    }
    
    func declareWinner(winningPlayer: Int) {
        if winningPlayer == 1 {
            
            // Player 1 Won
            //playerTwoLootBtn.hidden = false
            
        } else if winningPlayer == 2 {
            
            // Player 2 Won
            //playerOneLootBtn.hidden = false
            
        }
        
        // deathMusic.play()
        
        //NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "fightCountdown", userInfo: nil, repeats: false)
    
        fightCountdown()
    }
    
    func resetHp() -> Bool {
        
        if let playerOneHp: Int = playerOne.resetHp(), let playerTwoHp: Int = playerTwo.resetHp() {
            
            playerOneHpLbl.text = "\(playerOneHp) HP"
            playerTwoHpLbl.text = "\(playerTwoHp) HP"
            
            if playerOneImg.image != UIImage(named: "donald-trump-standing") {
                playerOneImg.image = UIImage(named: "donald-trump-standing")
            } else if playerTwoImg.image != UIImage(named: "donald-trump-standing-flipped") {
                playerTwoImg.image = UIImage(named: "donald-trump-standing-flipped")
            }
            
            if playerOneImg.hidden == true {
                playerOneImg.hidden = false
            } else if playerTwoImg.hidden == true {
                playerTwoImg.hidden = false
            }
            
            return true
            
        } else {
            
            return false
        }
    
    }
    
    func delayAttack(targetPlayer: Int) {
        if targetPlayer == 1 {
            playerOneAttackBtn.hidden = true
            
            if fightIsOn == true {
                NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showPlayerOneAttackBtn", userInfo: nil, repeats: false)
            }
            
        } else if targetPlayer == 2 {
            playerTwoAttackBtn.hidden = true
            
            if fightIsOn == true {
                NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showPlayerTwoAttackBtn", userInfo: nil, repeats: false)
            }
        }
        
        
    }
    
    func showPlayerOneAttackBtn() {
        playerOneAttackBtn.hidden = false
    }
    
    func showPlayerTwoAttackBtn() {
        playerTwoAttackBtn.hidden = false
    }
    
    func showFist(targetPlayer: Int) {
        if targetPlayer == 1 {
            playerOneFist.hidden = false
        } else {
            playerTwoFist.hidden = false
        }
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "hideFists", userInfo: nil, repeats: false)
    }
    
    
    func hideFists() {
        playerOneFist.hidden = true
        playerTwoFist.hidden = true
    }
}
