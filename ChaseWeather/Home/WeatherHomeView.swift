//
//  Untitled.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/2/26.
//


import SwiftUI

struct WeatherHomeView: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        // Large title color
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        // Small title color
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    @State private var searchText: String = ""
    
    let data: [CityWeather] = [
        CityWeather(city: "Edison", subtitle: "My Location • Home", condition: "Clear", temperature: "-7°", high: "2°", low: "-11°", style: .clearNight, iconName: "cloud.moon.fill"),
        CityWeather(city: "New York", subtitle: "8:10 PM", condition: "Clear", temperature: "-6°", high: "2°", low: "-10°", style: .clearNight, iconName: "cloud.moon.fill"),
        CityWeather(city: "Chicago", subtitle: "7:10 PM", condition: "Mostly Cloudy", temperature: "-5°", high: "-2°", low: "-7°", style: .cloudy, iconName: "cloud.moon.fill"),
        CityWeather(city: "Phillipsburg", subtitle: "8:10 PM", condition: "Clear", temperature: "-9°", high: "0°", low: "-14°", style: .clearNight, iconName: "cloud.moon.fill"),
        CityWeather(city: "San Francisco", subtitle: "5:10 PM", condition: "Beach Hazards Statement", temperature: "16°", high: "19°", low: "9°", style: .cloudy, iconName: "cloud.moon.fill"),
        CityWeather(city: "Kathmandu", subtitle: "6:55 AM", condition: "Mostly Sunny", temperature: "10°", high: "20°", low: "9°", style: .sunny, iconName: "cloud.moon.fill")
    ]
    
    var filteredData: [CityWeather] {
        if searchText.isEmpty { return data }
        return data.filter { $0.city.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color.blue, Color.blue.opacity(0.6)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                List {
                    Section {
                        ForEach(filteredData) { item in
                            NavigationLink(value: item) {
                                WeatherRowView(weather: item)
                                    .listRowInsets(EdgeInsets())
                                    .listRowBackground(Color.clear)
                                    .padding(.vertical, 6)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Weather App")
            .navigationBarTitleDisplayMode(.large)
            
            
            // ⋯ More button
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    MoreButton {
                        print("More tapped")
                    }
                }
            }
            
            // Destination mapping
            .navigationDestination(for: CityWeather.self) { city in
                //CityWeatherDetailView(city: city)
                WeatherDetailView()
            }
        }
        
        
        
        // 🔍 Custom Search
        SearchBar(text: $searchText)
    }
}


struct WeatherRowView: View {
    let weather: CityWeather
    
    var body: some View {
        ZStack {
            weather.style.gradient
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack(alignment: .center) {
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(weather.city)
                            .font(.title2)
                            .bold()
                        
                        Text(weather.subtitle)
                            .font(.subheadline)
                            .opacity(0.85)
                    }
                    
                    Spacer()
                    
                    // 🌤 Weather Icon + Temp
                    VStack(spacing: 6) {
                        Image(systemName: weather.iconName)
                            .symbolRenderingMode(.hierarchical)
                            .font(.system(size: 28))
                        
                        Text(weather.temperature)
                            .font(.system(size: 38, weight: .light))
                    }
                }
                
                HStack {
                    Text(weather.condition)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("H:\(weather.high)  L:\(weather.low)")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .frame(height: 120)
        .cornerRadius(22)
    }
}


    
enum WeatherCardStyle {
    case clearNight, cloudy, sunny
    
    var gradient: LinearGradient {
        switch self {
        case .clearNight:
            return LinearGradient(
                colors: [Color.blue, Color.cyan],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .cloudy:
            return LinearGradient(
                colors: [Color.blue, Color.cyan],
                startPoint: .top,
                endPoint: .bottom
            )
        case .sunny:
            return LinearGradient(
                colors: [Color.blue, Color.cyan],
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
}



#Preview {
    WeatherHomeView()
}
