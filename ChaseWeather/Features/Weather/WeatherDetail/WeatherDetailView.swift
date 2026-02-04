//
//  WeatherDetailView.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/2/26.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @State var cityWeather: CityWeather
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color.blue, Color.blue.opacity(0.6)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    HeaderView(cityWeather: cityWeather)
                    PrecipitationBanner()
                    InfoGrid()
                    WindCard()
                    BottomGrid()
                    Spacer(minLength: 80)
                }
                .padding()
            }
            
        }
    }
}


struct WindCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("WIND")
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Wind      6 mph")
                    Text("Gusts     9 mph")
                    Text("Direction 282° WNW")
                }
                .foregroundColor(.white)
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: "arrow.right")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .frame(height: 180)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
    }
}

struct BottomGrid: View {
    var body: some View {
        HStack(spacing: 16) {
            WeatherCard(title: "SUNRISE",
                        bigValue: "7:05 AM",
                        description: "Sunset: 5:18 PM")
            
            WeatherCard(title: "PRECIPITATION",
                        bigValue: "0”",
                        description: "None expected in next 10 days.")
        }
    }
}

struct BottomGlassBar: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "map.fill")
                Spacer()
                Image(systemName: "location.fill")
                Spacer()
                Image(systemName: "line.3.horizontal")
            }
            .padding()
            .background(.ultraThinMaterial, in: Capsule())
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
            .foregroundColor(.white)
        }
    }
}
