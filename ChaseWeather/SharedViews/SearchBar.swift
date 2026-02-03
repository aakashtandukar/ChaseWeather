//
//  SearchBar.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search for a city", text: $text)
                .foregroundColor(.black)
                .autocapitalization(.none)
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(12)
        .background(Color.white.opacity(0.08))
        .cornerRadius(14)
        .padding(.horizontal)
    }
}
