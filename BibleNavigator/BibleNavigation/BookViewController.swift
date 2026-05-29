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

    init() {
        self.books = bibleService.books
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
