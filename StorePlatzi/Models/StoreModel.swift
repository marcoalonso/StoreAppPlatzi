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
    @Published var products: [Product] = []
    
    func fetchCategories() async throws {
        //categories = try await client.getCategories(url: URL.allCategories)
        //replaced by
        categories = try await client.load(Resource(url: URL.allCategories))
    }
    
    func fetchProductsByCategory(_ categoryId: Int) async throws {
        //products = try await client.getProductsByCategory(url: URL.productsByCategory(categoryId))
        //replaced by
        products = try await client.load(Resource(url: URL.productsByCategory(categoryId)))
    }
    
    func saveProduct(_ createProductRequest: CreateProductRequest) async throws {
        //encode de CreateProductRequest
        let data = try JSONEncoder().encode(createProductRequest)
        let product : Product = try await client.load(Resource(url: URL.saveProduct, method: .post(data)))
        products.append(product)
    }
}
