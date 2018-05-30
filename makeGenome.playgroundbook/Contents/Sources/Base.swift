//
//  Base.swift
//  DNAGood
//
//  Created by TonySellitto on 25/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit
import SpriteKit

public class Base {
    /*
     Name */
    public var name: String?
    
    /*
     Description */
    public var image: UIImage?
    
    /*
     Description */
    public var description: String?
    
    /*
     SKScene for base animation */
    public var scene: SKScene?
    
    /* Background Gradient Colors */
    
    public var gradientColors: [CGColor]
    
    /*
     Required init */
    public required init(name: String, image: UIImage, description: String, scene: SKScene, gradientColors: [CGColor]) {
        self.name = name
        self.description = description
        self.image = image
        self.scene = scene
        self.gradientColors = gradientColors
    }

}
