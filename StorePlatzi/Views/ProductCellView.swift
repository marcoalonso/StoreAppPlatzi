//
//  ProductCellView.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 28/11/22.
//

import SwiftUI

struct ProductCellView: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: product.images?.first) { image in
                image.resizable()
                    .frame(maxWidth: 100, maxHeight: 110)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding()
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text(product.title)
                        .bold()
                    Spacer()
                    
                    Text(product.price, format: .currency(code: Locale.currencyCode))
                        .padding(8)
                        .foregroundColor(.white)
                        .background {
                            Color.green
                        }.clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
                }
                Text(product.description)
            }
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product.preview)
    }
}
