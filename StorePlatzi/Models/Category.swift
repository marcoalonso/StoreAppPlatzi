//
//  Category.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 28/11/22.
//

import Foundation

struct Category: Codable, Hashable {
    let id: Int
    let name: String
    let image: URL
}

extension Category {
    static var preview: Category {
        Category(id: 4, name: "AppleProducts", image: URL(string: "https://isenacode.com/wp-content/uploads/2018/07/gamaproductos-apple.jpg")!)
    }
}
