//
//  BaseCollectionViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BaseCollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    // int is the section identifier, and string is the item identifier
    var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    var data: [String] {
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        applySnapshot()
        
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
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        dataSource = UICollectionViewDiffableDataSource<Int, String>(
            collectionView: collectionView
        ) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            var content = UIListContentConfiguration.cell()
            content.text = item

            cell.contentConfiguration = content
            
            return cell
        }
        
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()

        snapshot.appendSections([0])
        snapshot.appendItems(data)

        dataSource.apply(snapshot, animatingDifferences: true)
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
    
    func didSelect(item: String) {
        // subclasses override
    }
    
}

extension BaseCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath)
        else { return }

        didSelect(item: item)
    }
}
