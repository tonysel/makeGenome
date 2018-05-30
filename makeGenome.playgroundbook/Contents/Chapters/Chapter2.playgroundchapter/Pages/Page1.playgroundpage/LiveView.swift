/*:
 ## **Create a chromosome**
 
 Do you remember informations that you read in the previous chapter? Well, let's put ourselves to the test.
 Adenine, Cytosine, Guanine and Thymine can be joined together in pairs of two.
 The shapes of their heads are complementary.
 At the end, there is a surprise.
 
 **Challenge:** Choose which function to invoke to create the compliant chain, between `createTopChain()` & `createBottomChain()` ,to that shown on the screen and, subsequently, merge the bases in pairs of two, simply tapping on those of interest.
 
 //:Tap `Run My Code` to show the changes you make.
 
 [**Next Page**](@next)
 */
//#-hidden-code
/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information.
 This is an example playground page.
*/
import UIKit
import SpriteKit
import PlaygroundSupport
selectedLevel = "level"
public let vc = GameViewController.loadFromStoryboard() as! GameViewController
PlaygroundPage.current.assessmentStatus = .fail(hints: ["Observe the question mark on the screen, invoke the appropriate function to create the complementary bases in that view position", "Choose a base above and one below to form a new bond"], solution: "Invoke function createTopChain() and remember bonds A-T & C-G")
PlaygroundPage.current.liveView = vc
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, createTopChain(), createBottomChain())
