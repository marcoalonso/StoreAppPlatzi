//
//  ProductListScreen.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 28/11/22.
//

import SwiftUI

struct ProductListScreen: View {
    
    let category: Category
    @EnvironmentObject private var storeModel: StoreModel
    
    var body: some View {
        List(storeModel.products, id: \.id) { product in
            ProductCellView(product: product)
        }
        .listStyle(.plain)
        .task {
            do {
                try await storeModel.fetchProductsByCategory(category.id)
            } catch {
                print(error)
            }
        }.navigationTitle(category.name)
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductListScreen(category: Category(id: 1, name: "SmartPhones", image: URL(string: "https://www.techadvisor.com/wp-content/uploads/2022/06/best_smartphone_apr_2022_hero.jpg?quality=50&strip=all")!)).environmentObject(StoreModel())
        }
    }
}
