//
//  VerseViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class VerseViewController: BaseCollectionViewController {
    var verses: Int = 0
    var chapter: Int = 0
    var book: Book? = nil
    
    override var data: [String] {
        if verses == 0 {
            print("No verses for chapter \(String(chapter)) of book \(book?.title ?? "Unknown")")
            return []
        }

        // construct the data with a for loop
        var array: [String] = []
        for verse in 1...verses {
            array.append(String(verse))
        }
        return array
    }
    
    override func didSelect(item: String) {
        // reference to olive tree bible
    }
}
