//
//  ChapterViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class ChapterViewController: BaseCollectionViewController {
    var chapters: [Chapter] = []
    var book: Book? = nil
    
    override var data: [String] {
        // construct the data with a for loop
        var array: [String] = []
        for chapter in chapters {
            array.append(String(chapter.id))
        }
        return array
    }
    
    override func didSelect(item: String) {
        
        let verseViewController = VerseViewController()
        for chapter in chapters {
            if String(chapter.id) == item {
                verseViewController.verses = chapter.verses
                verseViewController.chapter = chapter
                verseViewController.book = book
            }
        }
        navigationController?.pushViewController(
            verseViewController,
            animated: true
        )
    }
}
