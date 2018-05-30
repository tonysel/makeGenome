//
//  GameViewController.swift
//  DNAGood
//
//  Created by TonySellitto on 23/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(GameViewController)
public class GameViewController: UIViewController {
    
    public static var shared = GameViewController()
    @IBOutlet var safeArea: UIView!
    //@IBOutlet var backgroundGradientView: UIView!
    @IBOutlet weak var gameSceneView: SKView!
    public var scene: GameScene!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        
        #if !(arch(i386) || arch(x86_64))
            NSLayoutConstraint.activate([
                safeArea.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor, constant: 20),
                safeArea.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor)
                ])
        #endif
        
        GameScene.scene = GameScene(size: CGSize(width: 1024, height: 768))
        GameSceneGenome.sceneGenome = GameSceneGenome(size: CGSize(width: 1024, height: 768))
        
        GameSceneGenome.sceneGenome.scaleMode = .aspectFit
        GameScene.scene.scaleMode = .aspectFit
//        gameSceneView.showsFPS = true
//        gameSceneView.showsNodeCount = true
        
        switch selectedLevel {
        case "level":
            gameSceneView.presentScene(GameScene.scene)
        case "level2":
            gameSceneView.presentScene(GameSceneGenome.sceneGenome)
        default:
             gameSceneView.presentScene(GameScene.scene)
        }
        
        
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Release any cached data, images, etc that aren't in use.
    }
    

}

#if !(arch(i386) || arch(x86_64))
    extension GameViewController: PlaygroundLiveViewSafeAreaContainer {}
#endif

extension GameViewController {
    public class func loadFromStoryboard() -> UIViewController? {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
}


