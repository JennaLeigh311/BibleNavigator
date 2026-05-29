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
        layout.sectionInset = UIEdgeInsets(
            top: 20,
            left: 20,
            bottom: 20,
            right: 20
        )

        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 100, height: 200)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self // tell the collection view where the data is coming from
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        renderBooks()
        
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
    
    func renderBooks() {
        // for each book
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
//        self.addSubview(currentButton)
//        currentButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
//
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! BookCollectionViewCell
        cell.label.text = books[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        let selectedBook = books[indexPath.item]

        print("Tapped \(selectedBook)")

        navigationController?.pushViewController(
            ChapterViewController(),
            animated: true
        )
    }
}
