//
//  CitySearchView.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

struct CitySearchView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    
    let cities = ["New York", "Chicago", "San Francisco", "Kathmandu", "Edison"]
    
    var filtered: [String] {
        searchText.isEmpty ? cities :
        cities.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationStack {
            List(filtered, id: \.self) { city in
                Button {
                    print("Selected \(city)")
                    dismiss()
                } label: {
                    Text(city)
                }
            }
            .navigationTitle("Search City")
            .searchable(text: $searchText, prompt: "Search for a city or airport")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
