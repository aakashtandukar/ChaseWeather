//
//  WeatherRepositoryProtocol.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func getCityWeather(latitude: Double, longitude: Double) async -> Result<CityWeather, ApiError>
    func getCityList(query: String) async -> Result<CityNameList, ApiError>
}
