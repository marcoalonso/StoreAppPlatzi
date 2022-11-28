//
//  StoreModel.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 28/11/22.
//

import Foundation

@MainActor //MainQueque
class StoreModel : ObservableObject {
    
    let client = StoreHTTPClient()
    @Published var categories: [Category] = []
    
    func fetchCategories() async throws {
        categories = try await client.getCategories(url: URL.allCategories)
    }
}