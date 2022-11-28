//
//  URL+Extensions.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 28/11/22.
//

import Foundation

extension URL {
    static var development : URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    
     static var production : URL {
         URL(string: "https://api.escuelajs.co")!
     }
    static var ´default´ : URL {
        #if DEBUG
        return development
        #else
        return production
        #endif
    }
    
    //dependiendo del schema, se creará este EndoPoint
    static var allCategories: URL {
        URL(string: "/api/v1/categories/", relativeTo: Self.´default´)!
    }
    
}
