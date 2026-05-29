//
//  VerseViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class VerseViewController: BaseCollectionViewController {
    var verses: Verses? = nil
    var chapter: Chapter? = nil
    var book: Book? = nil
    
    override var data: [String] {
        // construct the data with a for loop
        var array: [String] = []
        for verse in 1...(verses?.count ?? 1) {
            array.append(String(verse))
        }
        return array
    }
    
    override func didSelect(item: String) {
        // reference to olive tree bible
    }
}
