//
//  CityWeather.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

struct CityWeather: Identifiable, Hashable {
    let id = UUID()
    let city: String
    let subtitle: String
    let condition: String
    let temperature: String
    let high: String
    let low: String
    let iconName: String
    let style: WeatherCardStyle = WeatherCardStyle.sunny

    var iconURL: URL {
        URL(string: "https://openweathermap.org/img/wn/\(iconName).png")!
    }

    var temperatureValue: Double {
        Double(temperature.dropLast(2)) ?? 0.0
    }

    init?(from response: WeatherResponse) {
        guard let name = response.name,
              let main = response.main,
              let weatherCondition = response.weather?.first else {
            return nil
        }

        
        let country        = response.sys?.country ?? "??"
        let feelsLikeStr   = Self.formatKelvin(main.feelsLike)
        let tempStr        = Self.formatKelvin(main.temp)
        let highStr        = Self.formatKelvin(main.tempMax)
        let lowStr         = Self.formatKelvin(main.tempMin)
        let conditionStr  = weatherCondition.main ?? "Unknown"
        let iconStr       = weatherCondition.icon ?? "questionmark"

        
        self.city        = name
        self.subtitle    = "\(country) • Feels like \(feelsLikeStr)"
        self.condition   = conditionStr
        self.temperature = tempStr
        self.high        = highStr
        self.low         = lowStr
        self.iconName    = iconStr
    }

    // MARK: - Helpers
    private static func formatKelvin(_ kelvin: Double?) -> String {
        guard let kelvin else { return "N/A" }
        let celsius = kelvin - 273.15
        return String(format: "%d°C", Int(celsius))
    }
}
