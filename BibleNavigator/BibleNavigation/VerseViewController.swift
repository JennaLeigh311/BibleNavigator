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
        // reference to olive tree bible TODO
        
        // Source - https://stackoverflow.com/a/33932755
        // Posted by Orkhan Alizade, modified by community. See post 'Timeline' for change history
        // Retrieved 2026-05-29, License - CC BY-SA 4.0
        let oliveTreeHooks = "olivetree://bible/\(book?.id ?? 0)/\(chapter)/\(item)"
        let oliveTreeUrl = URL(string: oliveTreeHooks)!
        if UIApplication.shared.canOpenURL(oliveTreeUrl)
        {
            UIApplication.shared.open(oliveTreeUrl)
        } else {
            //redirect to safari because the user doesn't have the app
            UIApplication.shared.open(URL(string: "http://instagram.com/")!)
        }

    }
}
