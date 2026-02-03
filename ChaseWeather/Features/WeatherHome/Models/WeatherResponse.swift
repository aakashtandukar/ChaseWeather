//
//  WeatherResponse.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

// MARK: - Raw API Response (All fields optional to avoid crashes on missing data)
struct WeatherResponse: Codable {
    let coord: Coordinates?
    let weather: [WeatherCondition]?
    let main: MainWeather?
    let wind: Wind?
    let clouds: Clouds?
    let sys: SystemInfo?
    let name: String?
    let cod: Int?
}

// MARK: - Nested Types (All optional where appropriate)

struct Coordinates: Codable {
    let lon: Double?
    let lat: Double?
}

struct WeatherCondition: Codable {
    let main: String?
    let description: String?
    let icon: String?
}

struct MainWeather: Codable {
    // Explicit snake_case mapping (only for renamed keys)
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin   = "temp_min"
        case tempMax   = "temp_max"
        case pressure
        case humidity
        case seaLevel  = "sea_level"   // often missing
        case grndLevel = "grnd_level"  // often missing
    }
    
    let temp: Double?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    let pressure: Int?
    let humidity: Int?
    let seaLevel: Int?
    let grndLevel: Int?
}

struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?   // Frequently missing → must be optional
}

struct Clouds: Codable {
    let all: Int?
}

struct SystemInfo: Codable {
    let type: Int?
    let id: Int?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}
