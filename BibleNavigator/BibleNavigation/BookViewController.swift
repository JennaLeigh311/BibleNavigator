//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/29/26.
//

import UIKit

class BookViewController: BaseCollectionViewController {
    
    var bibleService = BibleDataService()
    var books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await bibleService.fetchData()

            self.books = bibleService.books

            self.collectionView.reloadData() // recreate the cells based on new data
        }
    }
    
    override var data: [String] {
        // construct the data with a for loop
        var array: [String] = []
        for book in books {
            array.append(book.title)
        }
        return array
    }
    
    
    override func didSelect(item: String) {
        
        let chapterViewController = ChapterViewController()
        for book in books {
            if book.title == item {
                chapterViewController.chapters = book.chapters
                chapterViewController.book = book
            }
        }
        navigationController?.pushViewController(
            chapterViewController,
            animated: true
        )
        
    }
}
