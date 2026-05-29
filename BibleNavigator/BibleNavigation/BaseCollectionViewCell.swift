//
//  BookView.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

// Source on how to connect my button to a target action inside the view controller
// https://dev.to/msa_128/how-can-a-viewcontroller-communicate-an-action-to-a-button-in-a-view-j1

class BaseCollectionViewCell: UICollectionViewCell {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellStyling()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellStyling() {
        contentView.backgroundColor = .systemFill
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    func setupLabel() {
        label.frame = contentView.bounds
        label.textAlignment = .center
        label.textColor = .label
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            label.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20)
        ])
    }
    
}
