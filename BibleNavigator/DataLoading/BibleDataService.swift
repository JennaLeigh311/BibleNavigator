//
//  BibleDataService.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import Foundation
import Combine

class BibleDataService: ObservableObject {
    @Published var isLoading: Bool = true
    var books: [Book] = []
    
    var booksByTitle: [String: Book] = [:]
    
    // Source - https://medium.com/@garejakirit/how-to-call-apis-in-ios-using-swift-uikit-and-swiftui-220357d263bb
    func fetchData() async {
        guard let url = URL(string: "https://ot-s3-tom-hamming.s3.amazonaws.com/BibleJson.json") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            try parseData(data: data)
        } catch {
            print("Fetch or parsing error: \(error)")
        }
        isLoading = false
    }
    
    func parseData(data: Data) throws {
        do {
            let decoder = JSONDecoder()
            
            // fails here
            let rawResponse = try decoder.decode([String: RawBook].self, from: data)
            
            let convertedBooks: [Book] = rawResponse.compactMap { (key, rawBook) -> Book? in
                guard let id = Int(key) else { return nil }
                
                let chapters = rawBook.chapters.compactMap { chapterKey, verseValue -> (Int, Int)? in
                    guard let chapter = Int(chapterKey),
                          let verses = Int(verseValue) else {
                        return nil
                    }
                    return (chapter, verses)
                }
                
                return Book(
                    id: id,
                    title: rawBook.name,
                    chapters: Dictionary(uniqueKeysWithValues: chapters)
                )
            }.sorted { $0.id < $1.id }
            
            self.books = convertedBooks
            
            self.booksByTitle = Dictionary(
                uniqueKeysWithValues: convertedBooks.map { ($0.title, $0) }
            )
            
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }

}
