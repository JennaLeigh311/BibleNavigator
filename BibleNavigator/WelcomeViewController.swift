//
//  ViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setGradientBackground(colorTop: UIColor(
            red: 0/255,
            green: 18/255,
            blue: 66/255,
            alpha: 1.0
        ), colorBottom: UIColor(
            red: 0/255,
            green: 148/255,
            blue: 198/255,
            alpha: 1.0
        ))
    }
    
    // Source - https://stackoverflow.com/a/50040529
    // Posted by gmoraleda
    // Retrieved 2026-05-28, License - CC BY-SA 3.0
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
//        gradientLayer.frame = view.bounds

        view.layer.insertSublayer(gradientLayer, at: 0)
    }


    


}

