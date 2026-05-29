//
//  BookView.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

// Source on how to connect my button to a target action inside the view controller
// https://dev.to/msa_128/how-can-a-viewcontroller-communicate-an-action-to-a-button-in-a-view-j1

// TODO: make this a UICOllectionViewController?
class BookView: UICollectionView {
    
    // We define the callback method we want to use in our button
    var callback: (() -> Void)?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        
        renderBooks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("did not instanstiate coder")
    }
    
    func renderBooks() {
        // for each book
        let currentButton = setupBookButton()
        self.addSubview(currentButton)
        currentButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        
        // TODO: do all of this in a separate method called "positionButton"
        // disable Apple's automatic constraints so I can add my own AutoLayout constraints
        currentButton.translatesAutoresizingMaskIntoConstraints = false
        
        // apply constraints to center it relative to the parent view
        NSLayoutConstraint.activate([
            currentButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currentButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
        ])
    }
    
    func setupBookButton() -> UIButton {
        let bookButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        bookButton.setTitle("Genesis", for: .normal)
        bookButton.backgroundColor = .white
        bookButton.setTitleColor(.black, for: .normal)
        
        return bookButton
    }
    
    @objc
    private func buttonHandler(_ sender: UIButton) {
        callback?()
    }
    
}
