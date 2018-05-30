//
//  Base.swift
//  DNAGood
//
//  Created by TonySellitto on 23/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit
import SpriteKit


@objc(BaseNode)
public class BaseNode: SKSpriteNode {
    
        
        public var textureIdle = SKTexture(imageNamed: "A")
        //let textureMushroomGood = SKTexture(imageNamed: "mushroom-good")
        //let textureMushroomBad = SKTexture(imageNamed: "mushroom-bad")
        
        public init() {
           
            super.init(texture: textureIdle, color: .clear, size: SpriteSize.base)
            self.name = "base"
            self.zPosition = Z.sprites
            //self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
           // self.anchorPoint = CGPoint(x: 0, y: 1)
            
            // Physics
 //           self.physicsBody = SKPhysicsBody(rectangleOf: self.frame.size)
 //           self.physicsBody!.isDynamic = false
 //           self.physicsBody!.categoryBitMask = PhysicsMask.enemy
 //           self.physicsBody!.contactTestBitMask = PhysicsMask.bullet
//            self.physicsBody!.collisionBitMask = 0
        }
        
 //       func spawnMushroom() {
            
            // Invalidate Collision
            //     self.physicsBody!.contactTestBitMask = 0
            
            // Flipcoin
            //    let mushroomType = arc4random_uniform(2) == 1 ? (type: "good", color: SKColor.green) : (type: "bad", color: SKColor.red)
     //       let mushroomType = arc4random_uniform(2) == 1 ? (type: "good", texture: textureMushroomGood) : (type: "bad", texture: textureMushroomBad)
            
            // Create Mushrrom
            //    let mushroom = SKSpriteNode(color: mushroomType.color, size: SpriteSize.mushroom)
//            let mushroom = SKSpriteNode(texture: mushroomType.texture, color: .clear, size: SpriteSize.mushroom)
//            mushroom.name = "mushroom-\(mushroomType.type)"
//
//            // Physics
//            mushroom.physicsBody = SKPhysicsBody(rectangleOf: mushroom.frame.size)
//            mushroom.physicsBody!.isDynamic = true
//            mushroom.physicsBody!.affectedByGravity = true
//            mushroom.physicsBody!.categoryBitMask = PhysicsMask.mushroom
//            mushroom.physicsBody!.contactTestBitMask = PhysicsMask.player
//            mushroom.physicsBody!.collisionBitMask = PhysicsMask.player
//
//            // Positioning
//            mushroom.position = CGPoint(x: self.position.x, y: self.position.y)
//
//            parent?.addChild(mushroom)
            
            // Enemy explode
//            let enemyAction = SKAction.sequence([
//                SKAction.playSoundFileNamed("brick.m4a", waitForCompletion: false),
//                SKAction.scale(by: 2.0, duration: 0.2),
//                SKAction.wait(forDuration: 0.2),
//                SKAction.removeFromParent()
//                ])
//            self.run(enemyAction)
            
 //       }
   public func walk(destination pos: CGPoint) {
       
        
       
        let move = SKAction.move(to: pos, duration: 4)
        move.timingMode = .easeOut
       // let animIdle = SKAction.run { self.animate(type: "idle") }
        let animation = SKAction.sequence([move])
        self.run(animation)
    }
        // Swift requires this initializer
     public required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }



