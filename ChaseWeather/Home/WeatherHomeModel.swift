//
//  WeatherViewModel.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/2/26.
//

import SwiftUI

struct CityWeather: Identifiable {
    let id = UUID()
    let city: String
    let subtitle: String
    let condition: String
    let temperature: String
    let high: String
    let low: String
    let style: WeatherCardStyle
}
