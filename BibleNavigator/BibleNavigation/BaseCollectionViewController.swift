//
//  BaseCollectionViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BaseCollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        renderData()
        
        setupCustomViewConstrains()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    func setupCollectionView() {
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
    
    func renderData() {
        collectionView.register(BaseCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
    }
    
    func didSelect(item: String) {
        // subclasses override
    }
    
}

// Source - https://medium.com/@coolanil.saini/ios-uicollectionview-a-complete-guide-3152746763cc
extension BaseCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! BaseCollectionViewCell
        cell.label.text = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        self.didSelect(item: data[indexPath.item])
        
    }
}
