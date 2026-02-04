//
//  WeatherRowView.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

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
                    HStack(spacing: 6) {
                        AsyncImage(url: weather.iconURL) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                            } else if phase.error != nil {
                                // Show error/placeholder
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                            } else {
                                // Show placeholder while loading
                                ProgressView()
                            }
                        }
                        .frame(width: 50, height: 50) // Set appropriate size
                        

                        
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
