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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(book?.title ?? ""), Chapter \(chapter) Verses"
    }
    
    override func didSelect(item: String) {
        
        // Source - https://stackoverflow.com/a/54296065
        // Posted by Mohammad Mirzakhani, modified by community. See post 'Timeline' for change history
        // Retrieved 2026-06-01, License - CC BY-SA 4.0
        let oliveTreeUrl = "olivetree://bible/\(book?.id ?? 0).\(chapter).\(item)"
        if let url = URL(string: "\(oliveTreeUrl)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            //redirect to safari because the user doesn't have the app
            let appStoreURL = URL(string: "https://www.olivetree.com/blog/apps/ios/")!
            UIApplication.shared.open(appStoreURL)
        }

    }
}
