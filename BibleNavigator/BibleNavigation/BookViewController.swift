//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/29/26.
//

import UIKit

class BookViewController: BaseCollectionViewController {
    override var data: [String] {
        return ["Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy"]
    }
    
    override func didSelect(item: String) {
        
        navigationController?.pushViewController(
            ChapterViewController(),
            animated: true
        )
    }
}
