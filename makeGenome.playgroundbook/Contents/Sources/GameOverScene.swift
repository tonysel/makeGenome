//
//  GameOverScene.swift
//  DNAGood
//
//  Created by TonySellitto on 26/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit
import SpriteKit

@objc(GameOverScene)
class GameOverScene: SKScene {

    
    override func didMove(to view: SKView) {
        
        let bg : SKSpriteNode
        
        bg = SKSpriteNode(imageNamed: "Cells")
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg.alpha = 0.2
        let color = #colorLiteral(red: 0.942122519, green: 0.7134601474, blue: 0.5796499252, alpha: 1)
        color.withAlphaComponent(0.01)
        self.backgroundColor = color
        
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bg.zPosition = Z.background
        
        addChild(bg)
//
        
        let buttonStart = SKSpriteNode(imageNamed: "buttonRetry")
        
        buttonStart.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonStart.name = "buttonRetry"
        buttonStart.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        buttonStart.size = SpriteSize.button
        buttonStart.zPosition = Z.HUD
        addChild(buttonStart)
        
        
      
        
    }
    
    func touchDown(atPoint pos: CGPoint) {
        debugPrint("menu down: \(pos)")
        
    }
    
    func touchUp(atPoint pos: CGPoint) {
        debugPrint("menu up: \(pos)")
        
        let touchedNode = self.atPoint(pos)
        
        if touchedNode.name == "buttonRetry" {
            

            let scene = GameScene(size: size)
            scene.scaleMode = scaleMode
            let transitionType = SKTransition.flipHorizontal(withDuration: 0.5)
            
            view?.presentScene(scene, transition: transitionType)
           
            }
        }
        
    
        
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        self.touchDown(atPoint: touch.location(in: self))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        self.touchUp(atPoint: touch.location(in: self))
    }
    
}
