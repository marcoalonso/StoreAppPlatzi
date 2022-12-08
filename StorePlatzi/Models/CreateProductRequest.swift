//
//  CreateProductRequest.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 07/12/22.
//

import Foundation

struct CreateProductRequest: Encodable {
    
    let title: String
    let price: Double
    let description: String
    let categoryId: Int
    let images: [URL]
}
