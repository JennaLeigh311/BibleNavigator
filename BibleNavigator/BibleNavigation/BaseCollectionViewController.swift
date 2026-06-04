//
//  BaseCollectionViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BaseCollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var data: [String] {
        return []
    }
    
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
        let config = UICollectionLayoutListConfiguration(
            appearance: .insetGrouped
        )

        let layout = UICollectionViewCompositionalLayout.list(
            using: config
        )

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
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        var content = UIListContentConfiguration.cell()
        content.text = data[indexPath.item]

        cell.contentConfiguration = content
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        self.didSelect(item: data[indexPath.item])
        
    }
}
