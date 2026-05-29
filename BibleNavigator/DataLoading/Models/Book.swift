//
//  Book.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

struct Book: Codable {
    let id: Int
    let title: String
    let chapters: [Int: Int]
}
