//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BookViewController: UIViewController {
    
    let bookView = BookView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookView.callback = chooseBook
        
        view.addSubview(bookView)
        
        // setupCustomViewConstrains()
        
        Task {
            await animateIn()
        }
        
        setupCustomViewConstrains()
    }
    
    func setupCustomViewConstrains() {
        bookView.translatesAutoresizingMaskIntoConstraints = false
        // Making the customView to take all screen space
        NSLayoutConstraint.activate([
            bookView.topAnchor.constraint(equalTo: view.topAnchor),
            bookView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bookView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bookView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // Source - https://codemia.io/knowledge-hub/path/make_a_simple_fade_in_animation_in_swift
    func animateIn() async {
        await withCheckedContinuation { continuation in
            self.bookView.alpha = 0.0
            UIView.animate(
                withDuration: 0.7,
                animations: {
                    self.bookView.alpha = 1.0
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
