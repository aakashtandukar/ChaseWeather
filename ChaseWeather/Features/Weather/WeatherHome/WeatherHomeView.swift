//
//  Untitled.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/2/26.
//


import SwiftUI
import CoreLocation

struct WeatherHomeView: View {
    
    @State private var searchText: String = ""
    @State private var showSearchPage = false
    @FocusState private var isFocused: Bool
    
    @StateObject var viewModel: WeatherHomeViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                gradientBackgroundView()
                contentView(viewModel: viewModel)
            }
            .navigationTitle("Weather App")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSearchPage = true
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
           
        }
        .task {
            viewModel.requestLocationAndStart()
        }

    }

}


private struct contentView: View {
    @StateObject var viewModel : WeatherHomeViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.cityWeatherList) { item in
                WeatherRowView(weather: item)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .padding(.vertical, 6)
                    .onTapGesture {
                        viewModel.didSelectCity(item)
                    }
            }
        }
        .scrollContentBackground(.hidden)
        .listRowSeparator(.hidden)
    }
}

private struct gradientBackgroundView: View {
    var body : some View {
        LinearGradient(
            colors: [Color.blue, Color.blue.opacity(0.6)],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
    



//#Preview {
//    WeatherHomeView()
//}

