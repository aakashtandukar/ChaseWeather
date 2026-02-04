//
//  WeatherCardStyle.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

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
