//
//  CategoryListScreen.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 28/11/22.
//

import SwiftUI

struct CategoryListScreen: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(storeModel.categories, id: \.id) { category in
                    NavigationLink(value: category) {
                        HStack {
                            AsyncImage(url: category.image) { image in
                                image.resizable()
                                    .frame(maxWidth: 50, maxHeight: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            } placeholder: {
                                ProgressView()
                            }
                            Text(category.name)
                        }
                    }
                }.navigationDestination(for: Category.self, destination: { category in
                    ProductListScreen(category: category)
                })
                
                .task {
                    do{
                        try await storeModel.fetchCategories()
                    } catch {
                        errorMessage = error.localizedDescription
                    }
                }
                Text(errorMessage)
            }.navigationTitle("Store")
        }
    }
}

struct CategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListScreen().environmentObject(StoreModel())
    }
}
