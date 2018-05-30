//
//  GameScene.swift
//  DNAGood
//
//  Created by TonySellitto on 23/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//
import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport

@objc(GameScene)
public class GameScene: SKScene {
    
    public static var scene = GameScene()
    public var finished = false
    var hiddenAdd = false
    var soundCorrect : SKAction!
    var wepaSound : SKAction!
    var lockedBottomChain = false
    var lockedTopChain = false
    let addNode = SKSpriteNode(imageNamed: "question")
    var textureSadFirst = SKTexture()
    var textureSadSecond = SKTexture()
    
    var loading = false
    public var isVisibleCromosome = false
    var selectedFirstArray = false
    var selectedSecondArray = false
    var namesTopBases : [String] = ["adenine", "cytosine", "guanine", "timine"]
    var namesBottomBases : [String] = ["adenine", "cytosine", "guanine", "timine"]
    
    var choicedBases: [SKSpriteNode] = []
    let topBases = (rows: 1, cols: 4 )
    let bottomBases = (rows: 1, cols: 4 )
    var bases : [SKTexture] = [SKTexture(imageNamed: "a1"), SKTexture(imageNamed: "c1"), SKTexture(imageNamed: "g1"), SKTexture(imageNamed: "t1")]
    
    public override func sceneDidLoad() {
        soundCorrect = SKAction.playSoundFileNamed("soundCorrect.mp3", waitForCompletion: false)
        wepaSound = SKAction.playSoundFileNamed("wepaSound.mp3", waitForCompletion: false)
        
    }
    
    public func spawnTopBases() {
        
        if lockedTopChain == false {
            let gridSpacing = CGSize(width: 60, height: 25)
            let startingPoint = CGPoint(x: gridSpacing.width, y: (self.frame.height - gridSpacing.height - SpriteSize.base.height/2 ))
            
            for _ in 0..<topBases.rows {
                let positionY = startingPoint.y
                
                var position = CGPoint(x: startingPoint.x, y: positionY)
                
                for i in 1...topBases.cols {
                    let base = BaseNode()
                    
                    base.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                    base.zRotation = .pi
                    base.position = position
                    base.texture = bases[i - 1]
                    
                    base.name = namesTopBases[i - 1] + "1"
                    
                    addChild(base)
                    
                    position = CGPoint(x: position.x + base.frame.width/2 + gridSpacing.width, y: positionY)
                    
                }
            }
        }
        lockedTopChain = true
    }
    
    public func spawnBottomBases() {
        
        if lockedBottomChain == false {
            let gridSpacing = CGSize(width: 60, height: 50)
            let startingPoint = CGPoint(x: self.frame.width - gridSpacing.width, y:  gridSpacing.height + SpriteSize.base.height/2 )
            
            for _ in 0..<bottomBases.rows {
                let positionY = startingPoint.y
                var position = CGPoint(x: startingPoint.x, y: positionY)
                
                for i in 1...bottomBases.cols {
                    let base = BaseNode()
                    base.position = position
                    base.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                    base.texture = bases[i - 1]
                    base.name = namesBottomBases[i - 1] + "2"
                    addChild(base)
                    
                    position = CGPoint(x: position.x - base.frame.width/2 - gridSpacing.width, y: positionY)
                }
            }
        }
        
        lockedBottomChain = true
    }
    
    public func moveBase(node : SKSpriteNode){
        
        if ((node.name?.range(of: "2")) != nil) && !selectedSecondArray{
            // select array, so I cannot add another element of array
            selectedSecondArray = true
            // base added
            choicedBases.append(node)
            
            node.zPosition = Z.selectedBase
            
            let move = SKAction.move(to: CGPoint(x:(self.frame.midX), y: self.frame.midY - node.frame.height/2), duration: 2.5)
            move.timingMode = .easeOut
            
            let animation = SKAction.sequence([move])
            
            if (choicedBases.count == 2){
                loading = true
            }
            
            node.run(animation)
            
        }
        
        if ((node.name?.range(of: "1")) != nil) && !selectedFirstArray{
            selectedFirstArray = true
            choicedBases.append(node)
            
            node.zPosition = Z.selectedBase
            
            let move = SKAction.move(to: CGPoint(x:self.frame.midX, y: self.frame.midY + node.frame.height/2), duration: 2.5)
            move.timingMode = .easeOut
            
            if (choicedBases.count == 2){
                loading = true
            }
            
            let animation = SKAction.sequence([move])
            
            node.run(animation)
        }
        
    }
    
    override public func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = #colorLiteral(red: 0.942122519, green: 0.7134601474, blue: 0.5796499252, alpha: 1)
        
        let bg : SKSpriteNode
        
        bg = SKSpriteNode(imageNamed: "Cells")
        
        bg.size = CGSize(width: self.frame.width, height: self.frame.height - 80)
        bg.alpha = 0.3
        
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bg.zPosition = Z.background
        
        addChild(bg)
        addNode.position = CGPoint(x: self.frame.width/5, y: self.frame.height - 90)
        
        addNode.size = CGSize(width: addNode.frame.width/2, height: addNode.frame.height/2)
        
        let scaleBefore = SKAction.scale(by: 0, duration: 1)
        let scaleLater = SKAction.scale(to: 3, duration: 1)
        let sequence = SKAction.sequence([scaleBefore, scaleLater])
        addNode.run(SKAction.repeatForever(sequence))
        
        addChild(addNode)
        
        self.spawnBottomBases()
//        self.spawnTopBases()
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        print ("start")
    }
    
    //MARK: function to control choice
    public func controlChoice(){
        
        if (choicedBases[0].name == "adenine1" && choicedBases[1].name == "timine2" || choicedBases[1].name == "adenine1" && choicedBases[0].name == "timine2" || choicedBases[0].name == "adenine2" && choicedBases[1].name == "timine1" || choicedBases[1].name == "adenine2" && choicedBases[0].name == "timine1" || choicedBases[0].name == "guanine1" && choicedBases[1].name == "cytosine2" || choicedBases[1].name == "guanine1" && choicedBases[0].name == "cytosine2" || choicedBases[0].name == "guanine2" && choicedBases[1].name == "cytosine1" || choicedBases[1].name == "guanine2" && choicedBases[0].name == "cytosine1"){
            
            print("Done Good")
            
            
            let moveTopBase = SKAction.moveBy(x: 0, y: -SpriteSize.base.height/16, duration: 0.8)
            let moveBottomBase = SKAction.moveBy(x: 0, y: SpriteSize.base.height/16, duration: 0.8)
            let wait = SKAction.wait(forDuration: 2.1)
            let dissolvence = SKAction.fadeAlpha(to: 0, duration: 2)
            let delete = SKAction.removeFromParent()
            
            
            let animationOne = SKAction.sequence([moveTopBase, wait, dissolvence, delete])
            let animationTwo = SKAction.sequence([moveBottomBase, wait, dissolvence, delete])
            
            if(choicedBases[0].name?.range(of: "1") != nil){
                choicedBases[0].run(animationOne)
                choicedBases[1].run(animationTwo)
            }
            else{
                choicedBases[1].run(animationOne)
                choicedBases[0].run(animationTwo)
            }
            
            
            self.choicedBases.removeAll()
            
            
            if isVisibleCromosome == false{
                delay(seconds: 2){
                    self.continueGame()
                }
                
                delay(seconds: 4.7){
                    self.selectedFirstArray = false
                    self.selectedSecondArray = false
                }
                
            }
            
        }
            
        else{
            
            var animationSad0 = SKAction()
            var animationSad1 = SKAction()
            
            if choicedBases[0].name == "timine1" || choicedBases[0].name == "timine2"{
                textureSadFirst = (SKTexture(imageNamed: "ts"))
                choicedBases[0].xScale = 0.8
                choicedBases[1].xScale = 0.8
                animationSad0 = SKAction.animate(with: [textureSadFirst], timePerFrame: 5)
            }
            
            if choicedBases[1].name == "timine1" || choicedBases[1].name == "timine2" {
                textureSadSecond = (SKTexture(imageNamed: "ts"))
                choicedBases[0].xScale = 0.8
                choicedBases[1].xScale = 0.8
                animationSad1 = SKAction.animate(with: [textureSadSecond], timePerFrame: 5)
            }
            
            if choicedBases[0].name == "adenine1" || choicedBases[0].name == "adenine2" {
                textureSadFirst = (SKTexture(imageNamed: "as"))
                choicedBases[0].xScale = 0.8
                choicedBases[1].xScale = 0.8
                animationSad0 = SKAction.animate(with: [textureSadFirst], timePerFrame: 5)
            }
            
            if choicedBases[1].name == "adenine1" || choicedBases[1].name == "adenine2"{
                textureSadSecond = (SKTexture(imageNamed: "as"))
                choicedBases[0].xScale = 0.8
                choicedBases[1].xScale = 0.8
                animationSad1 = SKAction.animate(with: [textureSadSecond], timePerFrame: 5)
            }
            
            if choicedBases[0].name == "guanine1" || choicedBases[0].name == "guanine2" {
                textureSadFirst = (SKTexture(imageNamed: "gs"))
                choicedBases[0].xScale = 0.8
                choicedBases[1].xScale = 0.8
                animationSad0 = SKAction.animate(with: [textureSadFirst], timePerFrame: 5)
            }
            
            if choicedBases[1].name == "guanine1" || choicedBases[1].name == "guanine2"{
                textureSadSecond = (SKTexture(imageNamed: "gs"))
                choicedBases[0].xScale = 0.8
                choicedBases[1].xScale = 0.8
                animationSad1 = SKAction.animate(with: [textureSadSecond], timePerFrame: 5)
            }
            
            if choicedBases[0].name == "cytosine1" || choicedBases[0].name == "cytosine2" {
                textureSadFirst = (SKTexture(imageNamed: "cs"))
                choicedBases[0].xScale = 0.8
                choicedBases[1].xScale = 0.8
                animationSad0 = SKAction.animate(with: [textureSadFirst], timePerFrame: 5)
            }
            if choicedBases[1].name == "cytosine1" || choicedBases[1].name == "cytosine2" {
                textureSadSecond = (SKTexture(imageNamed: "cs"))
                choicedBases[0].xScale = 0.8
                choicedBases[1].xScale = 0.8
                animationSad1 = SKAction.animate(with: [textureSadSecond], timePerFrame: 5)
            }
            
            let moveTopBase = SKAction.moveBy(x: 0, y: -SpriteSize.base.height/20, duration: 0.8)
            let moveBottomBase = SKAction.moveBy(x: 0, y: SpriteSize.base.height/20, duration: 0.8)
            let wait = SKAction.wait(forDuration: 3)
            let dissolvence = SKAction.fadeAlpha(to: 0, duration: 2)
            let delete = SKAction.removeFromParent()
            
            
            let animationOne = SKAction.sequence([moveTopBase, moveBottomBase, moveTopBase, moveBottomBase, wait, dissolvence, delete])
            let animationTwo = SKAction.sequence([moveBottomBase, moveTopBase, moveBottomBase, moveTopBase, wait, dissolvence, delete])
            
            if(choicedBases[0].name?.range(of: "1") != nil){
                choicedBases[0].run(animationOne)
                choicedBases[0].run(animationSad0)
                choicedBases[1].run(animationTwo)
                choicedBases[1].run(animationSad1)
            }
            else{
                choicedBases[1].run(animationOne)
                choicedBases[0].run(animationTwo)
                choicedBases[0].run(animationSad0)
                choicedBases[1].run(animationSad1)
            }
            
            // wait a moment for gameOver scene
            delay(seconds: 4){
                self.wrongChoice()}
            
        }
    }
    
    
    public func wrongChoice(){
        
        print(choicedBases.count)
        
        print("not correct")
        
        self.selectedFirstArray = false
        self.selectedSecondArray = false
        self.choicedBases.removeAll()
        
        
        let scene = GameOverScene(size: self.size)
        scene.scaleMode = .aspectFit
        let transitionType = SKTransition.flipHorizontal(withDuration: 0.5)
        //scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: transitionType)
    }
    
    //MARK: initial function without top chain
    public func hideAdd(){
        
        addNode.run(SKAction.removeFromParent())
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // start game
        if lockedTopChain == true && lockedBottomChain == true && hiddenAdd == false{
            hiddenAdd = true
            self.hideAdd()
        }
        
        // control choice
        if selectedFirstArray && selectedSecondArray && loading {
            
            loading = false
            
            delay(seconds: 4.5){
                
                self.controlChoice()
                
            }
            
        }
        // control variable when you finish
        if children.count == 4{
            isVisibleCromosome = true
        }
        
        
        if children.count == 1  {
            
            self.buildCromosome()
            print("END")
            
        }
        
        
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
            let location = t.location(in: self)
            let node = atPoint(location)
            
            if node.name == "buttonRetry" {
                if selectedFirstArray && selectedSecondArray{
                    self.controlChoice()
                }
            }
            
            if node.name == "adenine1" {
                
                var nodee = SKSpriteNode()
                enumerateChildNodes(withName: "adenine1", using: { (node, _ ) in
                    nodee = node as! SKSpriteNode
                })
                moveBase(node: nodee)
                
            }
            
            if node.name == "timine1" {
                debugPrint("choiced timine1")
                var nodee = SKSpriteNode()
                enumerateChildNodes(withName: "timine1", using: { (node, _ ) in
                    nodee = node as! SKSpriteNode
                })
                moveBase(node: nodee)
                
            }
            
            if node.name == "cytosine1" {
                
                var nodee = SKSpriteNode()
                enumerateChildNodes(withName: "cytosine1", using: { (node, _ ) in
                    nodee = node as! SKSpriteNode
                })
                moveBase(node: nodee)
                
            }
            
            if node.name == "guanine1" {
                
                var nodee = SKSpriteNode()
                enumerateChildNodes(withName: "guanine1", using: { (node, _ ) in
                    nodee = node as! SKSpriteNode
                })
                moveBase(node: nodee)
                
            }
            
            if node.name == "adenine2" {
                debugPrint("choiced adenine2")
                var nodee = SKSpriteNode()
                enumerateChildNodes(withName: "adenine2", using: { (node, _ ) in
                    nodee = node as! SKSpriteNode
                })
                moveBase(node: nodee)
                
            }
            
            if node.name == "timine2" {
                
                var nodee = SKSpriteNode()
                enumerateChildNodes(withName: "timine2", using: { (node, _ ) in
                    nodee = node as! SKSpriteNode
                })
                moveBase(node: nodee)
                
            }
            
            if node.name == "cytosine2" {
                
                var nodee = SKSpriteNode()
                enumerateChildNodes(withName: "cytosine2", using: { (node, _ ) in
                    nodee = node as! SKSpriteNode
                })
                moveBase(node: nodee)
                
            }
            
            if node.name == "guanine2" {
                
                var nodee = SKSpriteNode()
                enumerateChildNodes(withName: "guanine2", using: { (node, _ ) in
                    nodee = node as! SKSpriteNode
                })
                moveBase(node: nodee)
                
            }
            
        }
    }
    
    //MARK: invocated function when you have finished mini game
    func buildCromosome() {
        finished = true
        let spark = SKSpriteNode(fileNamed: "Spark.sks")
        spark?.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        // let scale = SKAction.scale(to: 0, duration: 2)
        // spark?.run(SKAction.repeatForever(scale))
        spark?.isPaused = false
        addChild(spark!)
        
        
        let ref = SKSpriteNode(imageNamed: "cromosomeX")
        ref.zPosition = 100
        ref.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        ref.size = CGSize(width: ref.frame.width/8, height: ref.frame.height/8)
        addChild(ref)
        let scaleBefore = SKAction.scale(by: 2.4, duration: 2)
        let scaleLater = SKAction.scale(to: 1, duration: 2)
        //      let delete = SKAction.removeFromParent()
        let sequence = SKAction.sequence([scaleBefore, scaleLater, scaleBefore])
        
        
        ref.run(SKAction.repeatForever(sequence))
        ref.run(wepaSound)
        PlaygroundPage.current.assessmentStatus = .pass(message: "Congratulation ✅, you have created a chromosome X; you can try [next exercise](@next).")
    }
    
    //MARK: correct choiced & continue game
    func continueGame() {
        
        let ref = SKSpriteNode(imageNamed: "message1")
        ref.zPosition = 200
        ref.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        ref.size = CGSize(width: ref.frame.width/12, height: ref.frame.height/12)
        addChild(ref)
        let scaleBefore = SKAction.scale(by: 5, duration: 3)
        let scaleLater = SKAction.scale(to: 0, duration: 1)
        let delete = SKAction.removeFromParent()
        let sequence = SKAction.sequence([scaleBefore, scaleLater, delete])
 
        ref.run(sequence)
        ref.run(soundCorrect)
    }
    
    
}
