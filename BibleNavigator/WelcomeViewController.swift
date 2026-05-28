//
//  ViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func loadView() {
        view = WelcomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // load the API data?
        
        // set a timer, then invoke the next view controller?
    }
    
    func loadData() {
        
    }

    func invokeBibleNavigatorViewController() {
        
    }
    
    public func animateOut() async {
        await withCheckedContinuation { continuation in
            UIView.animate(
                withDuration: 1.0,
                animations: {
                    self.view.alpha = 0.0
                },
                completion: { _ in
                    self.view.isHidden = true
                    continuation.resume()
                }
            )
        }
    }

}

