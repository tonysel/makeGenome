/*:
 ## **Create a cell nucleus**
 
 People present **46** chromosomes per cell formation, in 23 pairs. The last couple determines our gender, a second that is XX (females) or XY (males).
 
 The total of 46 chromosomes (and thus the entire genetic heritage of a cell) is called a genome. Chromosomes do not roam freely in the cell, but are enclosed in a specific compartment: the nucleus.
 
 Total number of chromosomes varies from species to species. The surprising aspect of this variability is that, unlike what happened, it is not related to the complexity of the organism. For example, the fruit fly contains 8 chromosomes, the mouse 40, the dog 78, the shrimp even 254.
 
 At this point we can briefly summarize the main concepts we have faced:
 *every human cell contains in a specific area (the nucleus) an entire library (the genome) formed by 46 books (the chromosomes) written in a special language (DNA).*
 
 You can see, you found a *for loop*. In a very simple way you can write the function once inside a `for loop` statement that allows you to iterate the code inside as many times as you want.
 * callout(For loop statement):
 `for i in 1 ... number {`\
 `    myFunction()`\
 `}`
 
 **Challenge:** Create human nucleus cell using the right number of chromosomes inside it.
 
 **Hint:** Remember that you have to create first chromosomes and only then can you create nucleus.
 
 */
//:Tap `Run My Code` to show the changes you make.
 //#-hidden-code
 import UIKit
 import SpriteKit
 import PlaygroundSupport
 selectedLevel = "level2"
 public let vc = GameViewController.loadFromStoryboard() as! GameViewController
PlaygroundPage.current.assessmentStatus = .fail(hints: ["To create a nucleus you have to create first the chromosomes that make it up.", "Remember how many chromosomes there is in a human cell"], solution: "Invoke function `createChromosome()` for 46 times, via for loop, and then invoke function `createNucleus()`")
 PlaygroundPage.current.liveView = vc
 //#-end-hidden-code
 //#-code-completion(everything, hide)
 //#-code-completion(identifier, show, createChromosome(), createNucleus())

for i in 1 ... /*#-editable-code*/<#T##number##Int#>/*#-end-editable-code*/ {
    //#-editable-code
    <#tap code here#>
    //#-end-editable-code
}

//#-editable-code
<#tap code here#>
//#-end-editable-code
