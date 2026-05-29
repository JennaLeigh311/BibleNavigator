//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/29/26.
//

import UIKit

class BookViewController: BaseCollectionViewController {
    override func didSelect(item: String) {
        
        navigationController?.pushViewController(
            ChapterViewController(chapterVerse: item),
            animated: true
        )
    }
}
