//
//  DataModel.swift
//  DNAGood
//
//  Created by TonySellitto on 25/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit
import SpriteKit

public class DataModel{
    public static let shared = DataModel()
    
    public let basesArray : [Base]  = [Base(name: "Adenine", image: #imageLiteral(resourceName: "a1") , description: "Hi, I'm Adenine. I am one of the 4 bases that is the DNA, which in turn is incorporated into the chromosome. I tie myself, thanks to the shape of my head, with my brother Timine.", scene: SKScene(fileNamed: "AScene.sks")!, gradientColors: aGradientColors) , Base(name: "Thymine", image: #imageLiteral(resourceName: "t1"), description: "Hi guys, I'm Thymine. I am one of the 4 bases that is the DNA, which in turn is incorporated into the chromosome. I tie myself, thanks to the shape of my head, with my brother Adenine.", scene: SKScene(fileNamed: "TScene.sks")!, gradientColors: tGradientColors), Base(name: "Guanine", image: #imageLiteral(resourceName: "g1"), description: "Hi, I'm Guanine. I am one of the 4 bases that is the DNA, which in turn is incorporated into the chromosome. I tie myself, thanks to the shape of my head, with my brother Cytosine.", scene: SKScene(fileNamed: "GScene.sks")!, gradientColors: gGradientColors) , Base(name: "Cytosine", image: #imageLiteral(resourceName: "c1"), description: "Hi guys, I'm Cytosine. I am one of the 4 bases that is the DNA, which in turn is incorporated into the chromosome. I tie myself, thanks to the shape of my head, with my brother Guanine.", scene: SKScene(fileNamed: "CScene.sks")!, gradientColors: cGradientColors), Base(name: "Chromosome X", image: #imageLiteral(resourceName: "cromosomeX"), description: "Hi guys, I'm Chromosome X. I'm composed by DNA with my small brothers Adenine, Cytosine, Guanine & Timine. Chromosomes are 46, organized into 23 couples in every human cell. If the last couple contains two copies of me, you are facing a female cell", scene: SKScene(fileNamed: "CromosomeSceneX.sks")!, gradientColors: chromosomeGradientColors), Base(name: "Chromosome Y", image: #imageLiteral(resourceName: "cromosomeY"), description: "Hi guys, I'm Chromosome Y. I'm composed by DNA with my small brothers Adenine, Cytosine, Guanine & Timine. Chromosomes are 46, organized into 23 couples in every human cell. If the last couple contains a copy of me and a cromosome X, you are facing a male cell", scene: SKScene(fileNamed: "YScene.sks")!, gradientColors: chromosomeGradientColors)  ]

}
