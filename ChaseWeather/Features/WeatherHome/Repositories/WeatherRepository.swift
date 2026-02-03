//
//  WeatherRepository.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

final class WeatherRepository: WeatherRepositoryProtocol {
    
    private let apiService: ApiServiceProtocol
    
    // Dependency injection - enables mocking in tests
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    func getCityWeather(latitude: Double, longitude: Double) async -> Result<CityWeather, ApiError> {
        let endPoint = WeatherEndpoint.cityWeather(latitude: latitude, longitude: longitude)
        let response: Result<WeatherResponse, ApiError> = await apiService.request(endPoint)

        switch response {
        case .success(let response):
            guard let cityWeather = CityWeather(from: response) else {
                return .failure(.decodingData("Failed to map WeatherResponse to CityWeather"))
            }
            return .success(cityWeather)

        case .failure(let error):
            return .failure(error)
        }
    }
    
}
