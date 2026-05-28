//
//  ChapterViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class ChapterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Task {
            await animateIn()
        }
        
        view.backgroundColor = .green
        
    }
    
    // Source - https://codemia.io/knowledge-hub/path/make_a_simple_fade_in_animation_in_swift
    func animateIn() async {
        await withCheckedContinuation { continuation in
            self.view.alpha = 0.0
            UIView.animate(
                withDuration: 0.7,
                animations: {
                    self.view.alpha = 1.0
                },
                completion: { _ in
                    continuation.resume()
                }
            )
        }
    }
}
