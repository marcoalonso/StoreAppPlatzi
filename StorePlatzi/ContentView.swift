//
//  ContentView.swift
//  StorePlatzi
//
//  Created by Marco Alonso Rodriguez on 28/11/22.
// https://fakeapi.platzi.com/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
