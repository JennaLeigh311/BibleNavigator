//
//  ChapterViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class ChapterViewController: BaseCollectionViewController {
    var chapters: [Int: Int] = [:]
    var book: Book? = nil
    
    override var data: [String] {
        return chapters
            .keys
            .sorted()
            .map { String($0) }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(book?.title ?? "") Chapters"
    }
    
    override func didSelect(item: String) {
        
        let verseViewController = VerseViewController()
        guard let verses = chapters[Int(item) ?? 0] else  {
            print("No verses found for chapter \(item)")
            return
        }
        
        verseViewController.book = book
        verseViewController.chapter = Int(item) ?? 0
        verseViewController.verses = verses
        
        navigationController?.pushViewController(
            verseViewController,
            animated: true
        )
    }
}
