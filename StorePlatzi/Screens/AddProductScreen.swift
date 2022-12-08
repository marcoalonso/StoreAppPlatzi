//
//  AddProductScreen.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 07/12/22.
//

import SwiftUI

struct AddProductScreen: View {
    
    @State private var title: String = ""
    @State private var price: Double = 0.0
    @State private var description: String = ""
    @State private var selectedCategory: Category?
    @State private var imageUrl: String = ""
    @State private var errorMessage: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var storeModel: StoreModel
    
    private var isFormValid: Bool {
        !title.isEmpty && selectedCategory != nil && !imageUrl.isEmpty && !description.isEmpty && !price.isZero
    }
    
    private func saveProduct() {
        guard let category = selectedCategory,
              let imageURL = URL(string: imageUrl)
        else { return }
        
        let createProductRequest = CreateProductRequest(title: title, price: price, description: description, categoryId: category.id, images: [imageURL])
        
        Task {
            do {
                //save product
                try await storeModel.saveProduct(createProductRequest)
                dismiss()
            } catch {
                print("Debug: error \(error.localizedDescription)")
                errorMessage = "Error when user try save product."
            }
        }
    }
    
    var body: some View {
        Form {
            TextField("Enter title", text:  $title)
            TextField("Enter price", value:  $price, format: .number)
            TextField("Enter description", text:  $description)
            
            //category
            Picker("Categories", selection: $selectedCategory) {
                ForEach(storeModel.categories, id: \.id) { category in
                    Text(category.name)
                }
            }.pickerStyle(.wheel)
            
            TextField("Image url", text: $imageUrl)
        }.navigationTitle("Add Product")
            .onAppear {
                selectedCategory = storeModel.categories.first
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        if isFormValid {
                            saveProduct()
                        }
                    }.disabled(!isFormValid)
                }
            }
    }
}

struct AddProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        let storeModel = StoreModel()
        storeModel.categories = [Category(id: 1, name: "Electronics", image: URL(string: "https://www.techadvisor.com/wp-content/uploads/2022/06/best_smartphone_apr_2022_hero.jpg?quality=50&strip=all")!),
                                 Category(id: 2, name: "Demo", image: URL(string: "https://www.techadvisor.com/wp-content/uploads/2022/06/best_smartphone_apr_2022_hero.jpg?quality=50&strip=all")!),
                                 Category(id: 2, name: "Cars", image: URL(string: "https://www.techadvisor.com/wp-content/uploads/2022/06/best_smartphone_apr_2022_hero.jpg?quality=50&strip=all")!)
        ]
        return NavigationStack {
            AddProductScreen().environmentObject(storeModel)
        }
        
    }
}
