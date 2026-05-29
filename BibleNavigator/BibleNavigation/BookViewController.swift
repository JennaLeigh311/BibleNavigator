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
    
    func showLoadingScreen() {
        let spinner = UIActivityIndicatorView(style: .large)
        view.backgroundColor = .systemBackground

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.hidesWhenStopped = true // Automatically disappears when stopped
        view.addSubview(spinner)
        
        bibleService.$isLoading
            .receive(on: RunLoop.main) // Ensure UI updates happen on the main thread
            .sink { [weak self] loading in
                if loading {
                    spinner.startAnimating()
                } else {
                    spinner.stopAnimating()
                }
            }
            .store(in: &cancellables)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
}
