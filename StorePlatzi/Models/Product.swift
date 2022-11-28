//
//  Product.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 28/11/22.
//

import Foundation

struct Product: Codable {
    var id: Int?
    let title: String
    let price: Double
    let description: String
    let images: [URL]?
    let category: Category
}

extension Product {
    static var preview: Product {
        Product(id: 1, title: "iPhone 14 Pro Max", price: 24999.90, description: "The new iPhone 14 Pro Max with 512 Gb Ram and many HD cameras, in colors available: Red, Blue and Black.", images: [URL(string: "https://d500.epimg.net/cincodias/imagenes/2022/08/25/smartphones/1661432408_383843_1661432496_noticia_normal.jpg")!], category: Category.preview)
    }
}
