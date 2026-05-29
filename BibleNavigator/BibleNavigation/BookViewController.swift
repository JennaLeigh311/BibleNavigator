//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/29/26.
//

import UIKit

class BookViewController: BaseCollectionViewController {
    
    var bibleService = BibleDataService()
    var books: [Book] = [] // this should simply assing as the bibleService.books

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
                chapterViewController.chapter = book.contents.chapter
                chapterViewController.verses = book.contents.verses
                
            }
        }
        navigationController?.pushViewController(
            chapterViewController,
            animated: true
        )
        
    }
}
