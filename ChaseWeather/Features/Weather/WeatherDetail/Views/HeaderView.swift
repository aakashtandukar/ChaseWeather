//
//  HeaderView.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

struct HeaderView: View {
    let cityWeather: CityWeather
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: "moon.stars.fill")
                .font(.system(size: 60))
                .foregroundColor(.white.opacity(0.9))
            
            Text("HOME")
                .font(.caption)
                .bold()
                .foregroundColor(.white.opacity(0.7))
            
            Text(cityWeather.city)
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
