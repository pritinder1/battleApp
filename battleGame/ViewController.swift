//
//  ViewController.swift
//  battleGame
//
//  Created by Pritinder Singh  on 6/25/16.
//  Copyright © 2016 Pritinder Singh . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var enemyHealth: UILabel!
    @IBOutlet weak var enemyAttackBtn: UIButton!
    
    
    @IBOutlet weak var playerAttackBtn: UIButton!
    @IBOutlet weak var playerImg: UIImageView!
    
    @IBOutlet weak var playerHealth: UILabel!
    
    
    
    var player: Character!
    var enemy: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        player = Character(name: "Brave", hp: 150, attackPwr: 15)
        enemy = Character(name: "Orc", hp: 110, attackPwr: 10)
        
        let defaultText = "\(enemy.name) vs \(player.name) "
        
        outputLabel.text = defaultText
        
        playerHealth.text = "\(player.hp) HP"
        
        enemyHealth.text = "\(enemy.hp) HP"
        
        
  
    }
    
    
    
    @IBAction func enemyAttackPress(sender: AnyObject) {
        
        if player.attemptedAttack(enemy.attackPwr){
            
            outputLabel.text = "Attacked \(player.name)"
            playerHealth.text = "\(player.hp) HP"
            
            disableButton(playerAttackBtn)
            
            
            NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "enablePlayerButton", userInfo: nil, repeats: false)
        }
        
        manDown()
        
       
        
    }
    
        
    
    
    
    @IBAction func playerAttackPress(sender: AnyObject) {
        
        if enemy.attemptedAttack(player.attackPwr){
            
            outputLabel.text = "Attacked \(enemy.name)"
            enemyHealth.text = "\(enemy.hp) HP"
            disableButton(enemyAttackBtn)
            
            
            NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "enableEnemyButton", userInfo: nil, repeats: false)
            
            
            
        }
        
        manDown()
        
       
    
        
    }
    
    
    func manDown() {
        
        if !player.isAlive {
        
                outputLabel.text = "\(player.name) has Died"
            
                playerImg.hidden = true
                disableButton(playerAttackBtn)
                playerHealth.text = ""
            
                resetGame()
            
        }else if !enemy.isAlive {
        
        
                outputLabel.text = "\(enemy.name) has Died"
            
                enemyImg.hidden = true
                disableButton(enemyAttackBtn)
                enemyHealth.text = ""
            
                resetGame()
        }else {
        
            
        }
    }
    
    func characterReBirth() {
    
        playerImg.hidden = false
        enemyImg.hidden = false
        
        enemyAttackBtn.enabled = true
        playerAttackBtn.enabled = true
        
        
        self.viewDidLoad()
        
        
        
        
    }
    
    
    func resetGame() {
    
    
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.characterReBirth), userInfo: nil, repeats: false)
    }
    
    
    func disableButton(button: UIButton) {
    
            button.enabled = false
        
    }
    
    func enableEnemyButton(){
    
        enemyAttackBtn.enabled = true
    }
    
    func enablePlayerButton(){
        
        playerAttackBtn.enabled = true
    }
    

    



}
