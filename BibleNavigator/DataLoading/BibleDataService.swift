//
//  BibleDataService.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

class BibleDataService {
    var books: [Book] = []
    
    init() {
        // call all the functions here
    }
    
    func getData() {
        
    }
}

// how will the data be stored?

// book -> list(chapters:verses)

// we can have a book point to an array of chapter-verse tuples
// so books will be nodes, we'll access books from an array of books. each node points to an array of chapter-verse pairs
