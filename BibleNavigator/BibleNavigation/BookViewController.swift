//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BookViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    let books = ["Genesis", "Exodus", "Leviticus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        
        // setupCustomViewConstrains()
        
        setupCustomViewConstrains()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    func setupCustomViewConstrains() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        // Making the collectionView take all screen space
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    @objc func chooseBook() {
        self.navigationController?.pushViewController(ChapterViewController(), animated: true)
    }
    
}

// Source - https://medium.com/@coolanil.saini/ios-uicollectionview-a-complete-guide-3152746763cc
extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}
