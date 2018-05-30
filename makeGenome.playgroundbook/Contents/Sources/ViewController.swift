//
//  ViewController.swift
//  DNAGood
//
//  Created by TonySellitto on 23/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(ViewController)
public class ViewController: BackgroundViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return refBases.count
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "baseCell", for: indexPath) as! BaseCollectionViewCell
        
        let baseScene = refBases[indexPath.row].scene
        
        //let baseScene = SKScene(fileNamed: "AScene.sks")
        
       
        
//        if (indexPath.row == 1){
//            baseScene?.xScale = 0.2
//        }
        
        cell.skView.presentScene(baseScene)
        
        //baseScene?.isPaused = true
        baseScene!.backgroundColor = UIColor.black.withAlphaComponent(0)
        cell.skView.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
//    public override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        UIView.animate(withDuration: 0.2) {
//            self.collectionView.reloadData()
//        }
//    }
    
    
    @IBOutlet var safeArea: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    //let scene = SKScene(fileNamed: "DNAScene.sks")
    public let refBases = DataModel.shared.basesArray
    
    @IBOutlet weak var topView: UIView!
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.reloadData()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        #if !(arch(i386) || arch(x86_64))
            NSLayoutConstraint.activate([
                safeArea.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor, constant: 20),
                safeArea.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor)
                ])
        #endif
      
      //  scene?.backgroundColor = UIColor.black.withAlphaComponent(0)
        self.collectionView.backgroundColor = UIColor.clear
      self.topView.backgroundColor = UIColor.clear
//        self.setGradientBackground()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func setGradientBackground() {
        let colorBottom =  UIColor(red: 48.0/255.0, green: 210.0/255.0, blue: 190.0/255.0, alpha: 1).cgColor
        let colorTop = UIColor(red: 52.0/255.0, green: 147.0/255.0, blue: 196.0/255.0, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.locations = [ 0.4, 0.65]
        //gradientLayer.frame = self.view.bounds
        gradientLayer.frame = self.safeArea.bounds
        
        //self.view.layer.insertSublayer(gradientLayer, at: 0)
        self.safeArea.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
//        public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//            return CGSize(width: collectionView.frame.width / 3 , height: collectionView.frame.height / 3 )
//
//        }
//    //
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 10
//    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       //let cell = collectionView.cellForItem(at: indexPath) as! BaseCollectionViewCell
       // selectedBase = cell.currentFruit

        let baseDetail = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
       // baseDetail.passedItem = selectedFruit
        baseDetail.passedIndexRow = indexPath.row
        present(baseDetail, animated: true, completion: nil)


   }


}

#if !(arch(i386) || arch(x86_64))
    extension ViewController: PlaygroundLiveViewSafeAreaContainer {}
#endif

extension ViewController {
    public class func loadFromStoryboard() -> UIViewController? {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "present")
    }
}
