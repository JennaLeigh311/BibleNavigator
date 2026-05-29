//
//  RawBook.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/29/26.
//

struct RawBook: Codable {
    let name: String
    let chapters: [String: String]
}
