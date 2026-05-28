//
//  WelcomeView.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

// Source - https://www.delasign.com/blog/uiview-swift-recommendations/

class WelcomeView: UIView {
    static let identifier: String = "[CustomUIView]"
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

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
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("did not instanstiate coder")
    }
    
    func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

    }

    
    // Source - https://stackoverflow.com/a/50040529
    // Posted by gmoraleda
    // Retrieved 2026-05-28, License - CC BY-SA 3.0
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    func setupLabel() {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to Bible Navigator"
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .center
        
        
        // New York font
        welcomeLabel.font = UIFontDescriptor.preferredFontDescriptor(
            withTextStyle: .title2
        ).withDesign(.serif).map {
            UIFont(descriptor: $0, size: 0)
        }
        welcomeLabel.adjustsFontForContentSizeCategory = true
        
        self.addSubview(welcomeLabel)
        
        // disable Apple's automatic constraints so I can add my own AutoLayout constraints
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // apply constraints to center it relative to the parent view
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
