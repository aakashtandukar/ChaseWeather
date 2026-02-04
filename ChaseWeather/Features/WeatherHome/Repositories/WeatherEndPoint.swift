//
//  WeatherEndPoint.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

enum WeatherEndpoint: ApiEndPoint {
    
    case cityWeather(latitude: Double, longitude: Double)
    case cityList(query: String)
    

    var path: String {
        switch self {
            case .cityWeather:
                return "weather"
        case .cityList:
                return "citylist"
        }
    }
    
    var queryItems: [URLQueryItem]? {
            switch self {
            case .cityWeather(let latitude, let longitude):
                return [
                    URLQueryItem(name: "lat", value: "\(latitude)"),
                    URLQueryItem(name: "lon", value: "\(longitude)"),
                    URLQueryItem(name: "appid", value: Secrets.getValueFor(.weatherApiKey))
                ]
            case .cityList(query: let query):
                return [
                    URLQueryItem(name: "q", value: "\(query)"),
                    URLQueryItem(name: "appid", value: Secrets.getValueFor(.weatherApiKey))
                ]
            }
        }
    
}
