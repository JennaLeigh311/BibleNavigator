//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/29/26.
//

import UIKit
import Combine

class BookViewController: BaseCollectionViewController {
    
    var bibleService = BibleDataService()
    var books: [Book] = []
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingScreen()
        
        Task {
            await bibleService.fetchData()
            
            self.books = bibleService.books
            
            print("books: \(books)")

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
        
        guard let book = bibleService.booksByTitle[item] else {
            print("No book found for \(item)")
            return
        }
        
        let chapterViewController = ChapterViewController()
        chapterViewController.chapters = book.chapters
        chapterViewController.book = book

        navigationController?.pushViewController(
            chapterViewController,
            animated: true
        )
    }
    
    // Source - https://www.hackingwithswift.com/example-code/uikit/how-to-use-uiactivityindicatorview-to-show-a-spinner-when-work-is-happening
    //
    func showLoadingScreen() {
        let spinner = UIActivityIndicatorView(style: .large)
        view.backgroundColor = .systemBackground
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        
        // whenever isLoading changes, run this closure:
        bibleService.$isLoading
            .receive(on: RunLoop.main) // Ensure UI updates happen on the main thread because UIKit can only safely update UI on the mian thread
            .sink { loading in // .sink means "subscribe to this publisher, and loading is the newest value of isLoading
                if loading {
                    spinner.startAnimating()
                } else {
                    spinner.stopAnimating()
                }
            }
            .store(in: &cancellables) // store object of type AnyCancellables here because if no one keeps a reference to it, it gets destroyed. Now the subscription stays alive as long as this view controller is alive.

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
}
