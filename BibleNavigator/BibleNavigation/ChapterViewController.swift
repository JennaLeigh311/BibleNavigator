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
        return chapters.keys.map { String($0) }
    }
    
    override func didSelect(item: String) {
        
        let verseViewController = VerseViewController()
        guard case verseViewController.verses = chapters[Int(item) ?? 0] else {
            print("No verses found for chapter \(item)")
            return
        }
        
        verseViewController.book = book
        verseViewController.chapter = Int(item) ?? 0
        
        navigationController?.pushViewController(
            verseViewController,
            animated: true
        )
    }
}
