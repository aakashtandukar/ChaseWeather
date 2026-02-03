//
//  WeatherDetailView.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/2/26.
//

import SwiftUI

struct WeatherDetailView: View {
    
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
                    HeaderView()
                    PrecipitationBanner()
                    InfoGrid()
                    WindCard()
                    BottomGrid()
                    Spacer(minLength: 80)
                }
                .padding()
            }
            
            //BottomGlassBar()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: "moon.stars.fill")
                .font(.system(size: 60))
                .foregroundColor(.white.opacity(0.9))
            
            Text("HOME")
                .font(.caption)
                .bold()
                .foregroundColor(.white.opacity(0.7))
            
            Text("Edison")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            Text("-10° | Clear")
                .font(.title3)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding(.top, 20)
    }
}

struct PrecipitationBanner: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.ultraThinMaterial)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: "umbrella.fill")
                    Text("PRECIPITATION")
                        .bold()
                }
                .foregroundColor(.white.opacity(0.8))
            )
    }
}

struct InfoGrid: View {
    var body: some View {
        HStack(spacing: 16) {
            WeatherCard(title: "FEELS LIKE",
                        bigValue: "-12°",
                        description: "Wind is making it feel colder.")
            
            UVCard()
        }
    }
}

struct WeatherCard: View {
    let title: String
    let bigValue: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
            
            Text(bigValue)
                .font(.system(size: 40, weight: .light))
                .foregroundColor(.white)
            
            Spacer()
            
            Text(description)
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
        .frame(height: 180)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
    }
}

struct UVCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("UV INDEX")
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
            
            Text("0")
                .font(.system(size: 40, weight: .light))
                .foregroundColor(.white)
            
            Text("Low")
                .foregroundColor(.white)
            
            LinearGradient(colors: [.green, .yellow, .orange, .pink],
                           startPoint: .leading,
                           endPoint: .trailing)
                .frame(height: 6)
                .cornerRadius(3)
            
            Text("Low for the rest of the day.")
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
        .frame(height: 180)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
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
