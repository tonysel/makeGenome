//
//  DetailViewController.swift
//  DNAGood
//
//  Created by TonySellitto on 25/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(DetailViewController)
class DetailViewController: BackgroundViewController {
    
    var basesArray = DataModel.shared.basesArray
   
    @IBOutlet var safeArea: UIView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var nameComponent: UILabel!
    var passedIndexRow: Int!

    @IBOutlet weak var descriptionBase: UILabel!
    
     @IBOutlet weak var buttonBack: UIButton!
    // - MARK: Overrides
    public override func viewDidLoad() {
        super.viewDidLoad()
      
       
        imageBase.image = basesArray[passedIndexRow].image

        self.topView.backgroundColor = UIColor.clear
        nameComponent.text = basesArray[passedIndexRow].name
        
        descriptionBase.text = basesArray[passedIndexRow].description        
  
//        buttonBack.setImage(UIImage(named: "buttonRetry"), for: .normal)
        
       
        
        buttonBack.layer.cornerRadius = 10
        buttonBack.layer.borderWidth = 1
        
        let colorButton = UIColor(displayP3Red: 84/255, green: 139/255, blue: 135/255, alpha: 1)
        
        buttonBack.backgroundColor = colorButton
        
        buttonBack.titleLabel?.text =  "Back"
        buttonBack.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 20)

        #if !(arch(i386) || arch(x86_64))
            NSLayoutConstraint.activate([
                safeArea.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor, constant: 20),
                safeArea.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor)
                ])
        #endif
    }

    //@IBOutlet weak var skView: SKView!
    
    @IBOutlet weak var imageBase: UIImageView!
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


        
       // detailCollectionView.alpha = 0.0
        //   detailCollectionView.reloadData()
        //self.skView.alpha = 0.0
        self.imageBase.alpha = 0.0
        self.descriptionBase.alpha = 0.0
        self.nameComponent.alpha = 0.0
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.2) {
           // self.skView.alpha = 1.0
            self.imageBase.alpha = 1.0
            self.descriptionBase.alpha = 1.0
            self.nameComponent.alpha = 1.0
        }

    }

    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        //detailCollectionView.reloadData()
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // - MARK: Dismiss Detail View
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

#if !(arch(i386) || arch(x86_64))
    extension DetailViewController: PlaygroundLiveViewSafeAreaContainer {}
#endif
