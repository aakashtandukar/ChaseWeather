//
//  WeatherHomeModel.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/2/26.
//
import Foundation
import Combine

@MainActor
class WeatherHomeViewModel: ObservableObject {
    
    private let repository: WeatherRepositoryProtocol
    
    @Published var message: String = "Hello, World!"
    @Published var cityWeatherList: [CityWeather] = []
    
    init(repository: WeatherRepositoryProtocol) {
            self.repository = repository
            Secrets.verifyAllSecretsExist()
        
    }
    
    
    func getWeatherData() async {
        let url = Secrets.getValueFor(.apiBaseURL)
        print(url)
        
        switch await repository.getCityWeather(latitude: 44.34, longitude: 10.99) {
        case .success(let response):
            self.cityWeatherList = [response]
            print(response)
            
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
    
}
