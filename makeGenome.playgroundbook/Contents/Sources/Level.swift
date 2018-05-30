//
//  Level.swift
//  DNAGood
//
//  Created by TonySellitto on 23/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit

import Foundation
import SpriteKit

    
    public class Level {
        let scene: GameScene
        
        init() {
            guard let scene = SKScene(fileNamed: "DNAScene.sks") as? GameScene else {
                fatalError("Level not found")
            }
            scene.scaleMode = .aspectFit
            scene.backgroundColor = SKColor.clear
            self.scene = scene
        }
        
    }



