//
//  BibleDataService.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import Foundation

class BibleDataService {
    var books: [Book] = []
    
    init() {
        // call all the functions here
    }
    
    // Source - https://medium.com/@garejakirit/how-to-call-apis-in-ios-using-swift-uikit-and-swiftui-220357d263bb
    func fetchData() async {
        guard let url = URL(string: "https://ot-s3-tom-hamming.s3.amazonaws.com/BibleJson.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print("Parsing error: \(error)")
            }
        }.resume()
    }
}
