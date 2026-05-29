//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BookViewController: UIViewController {
    
    let bookView = BookView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookView.callback = chooseBook
        
        view.addSubview(bookView)
        
        // setupCustomViewConstrains()
        
        Task {
            await animateIn()
        }
        
        view.backgroundColor = .blue
        
        
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
    
    @objc func chooseBook() {
        self.navigationController?.pushViewController(ChapterViewController(), animated: true)
    }
    
}
