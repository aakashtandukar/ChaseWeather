//
//  WeatherCardView.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

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
