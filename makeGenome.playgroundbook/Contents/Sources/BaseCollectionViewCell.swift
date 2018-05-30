//
//  BaseCollectionViewCell.swift
//  DNAGood
//
//  Created by TonySellitto on 23/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit
import SpriteKit

@objc(BaseCollectionViewCell)
public class BaseCollectionViewCell: UICollectionViewCell {
  

    @IBOutlet weak var skView: SKView!
    
    var currentBase: Base?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
//    // - MARK: Config for Fruit Object
//    public func config(forBase base: Base){
//        fruitIBase.image = fruit.fruitImage
//        currentFruit = fruit
//    }
//    
//    // backup config
//    public func config(forName name: String){
//        fruitImage.image = UIImage(named: name)
//        if fruitImage.image != nil {
//            print(" image added ")
//        }
//        fruitImage.contentMode = .scaleAspectFit
//        print("added \(name)")
//    }
//    
    
}
