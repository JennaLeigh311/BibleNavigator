//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BookViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Task {
            await animateIn()
        }
        
        view.backgroundColor = .blue
        
        // render books here with renderBooks(), which uses an array of the books that were given to us, and calls setupBookButton() for each of them
        
        setupBookButton()
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
    
    func setupBookButton() {
        let bookButton = UIButton()
        bookButton.setTitle("Genesis", for: .normal)
        bookButton.setTitleColor(.black, for: .normal)
        bookButton.addTarget(self, action: #selector(chooseBook), for: .touchDown)
        
        
        view.addSubview(bookButton)
        
        // disable Apple's automatic constraints so I can add my own AutoLayout constraints
        bookButton.translatesAutoresizingMaskIntoConstraints = false
        
        // apply constraints to center it relative to the parent view
        NSLayoutConstraint.activate([
            bookButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bookButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
        ])
    }
    
    @objc func chooseBook() {
        self.navigationController?.pushViewController(ChapterViewController(), animated: true)
        
    }
}
