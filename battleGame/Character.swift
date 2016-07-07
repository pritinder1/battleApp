//
//  Character.swift
//  battleGame
//
//  Created by Pritinder Singh  on 6/25/16.
//  Copyright © 2016 Pritinder Singh . All rights reserved.
//

import Foundation


class Character {


    
    private var _hp = 100
    
    private var _attackPwr = 12
    
    
    
    var name: String
    
    
    var hp:Int {
    
        get {
        
            return _hp
        
        }
    
    }
    
    
    var attackPwr: Int {
    
    
        get{
        
            return _attackPwr
        
        }
    }
    
    
    var isAlive:Bool {
    
        if _hp <= 0 {
        
            return false
        }
        else {
        
            return true
        }
    
    }


    func attemptedAttack(attackPwr: Int) -> Bool{
        
        _hp -= attackPwr
        
        return true
    
    }
    
 
    
    
    
    init(name:String, hp:Int, attackPwr:Int){
    
        self.name = name
        self._hp = hp
        self._attackPwr = attackPwr
    }
    
    
    
}