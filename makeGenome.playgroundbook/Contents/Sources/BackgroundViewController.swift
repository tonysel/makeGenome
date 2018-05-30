//
//  BaseViewController.swift
//  DNAGood
//
//  Created by TonySellitto on 25/03/18.
//  Copyright © 2018 TonySellitto. All rights reserved.
//

import UIKit

@objc(BackgroundViewController)
public class BackgroundViewController: UIViewController {
    
    // - MARK: Variables
    public let gradientLayer = CAGradientLayer()
    public let gradientBackgroundView = UIView()
    
    
    // - MARK: Overrides
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // gradient background
        setupBackground(forColors: backgroundGradientColors)
        
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public override func viewWillLayoutSubviews() {
        self.gradientLayer.frame = self.view.bounds
    }
    
    // - MARK: Background Gradient Setup
    public func setupBackground(forColors gradientColors: [CGColor]){
        self.gradientLayer.colors = gradientColors
        self.gradientLayer.frame = self.view.frame
        
        self.gradientBackgroundView.frame = self.view.bounds
        self.gradientBackgroundView.backgroundColor = #colorLiteral(red: 0.942122519, green: 0.7134601474, blue: 0.5796499252, alpha: 1)
        self.gradientBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.gradientBackgroundView.layer.addSublayer(gradientLayer)
        self.view.addSubview(gradientBackgroundView)
        self.view.sendSubview(toBack: gradientBackgroundView)
        
        self.gradientBackgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.gradientBackgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.gradientBackgroundView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.gradientBackgroundView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        print("background has been set")
    }
}

