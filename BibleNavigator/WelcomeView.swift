//
//  WelcomeView.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

// Source: https://www.delasign.com/blog/uiview-swift-recommendations/

class WelcomeView: UIView {
    static let identifier: String = "[CustomUIView]"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: UI Specific Setup
        // Before calling your setup functions, call any visual functionality that may be required:
        // i.e. background color, isHidden, isUserInteractionEnabled or translatesAutoresizingMaskIntoConstraints.
        
        // MARK: Functionality Setup
        
    }
    
    func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

    }
    
    required init?(coder: NSCoder) {
        fatalError("did not instanstiate coder")
    }
    
}
