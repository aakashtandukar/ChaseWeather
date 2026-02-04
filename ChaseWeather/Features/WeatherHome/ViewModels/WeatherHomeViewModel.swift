//
//  WeatherHomeModel.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/2/26.
//
import Foundation
import Combine
import CoreLocation

@MainActor
class WeatherHomeViewModel: ObservableObject {
    
    private let repository: WeatherRepositoryProtocol
    
    @Published var message: String = "Hello, World!"
    @Published var cityWeatherList: [CityWeather] = []
    @Published var errorMessage: String?
    
    private let locationService: LocationServiceProtocol
    var locationServiceData = LocationService()
    
    init(repository: WeatherRepositoryProtocol, locationService: LocationServiceProtocol) {
            self.repository = repository
            Secrets.verifyAllSecretsExist()
        self.locationService = locationService
    }
    
    
    func getWeatherData() async {
        let url = Secrets.getValueFor(.apiBaseURL)
        print(url)
        
        switch await repository.getCityWeather(latitude: locationServiceData.latitude, longitude: locationServiceData.longitude) {
        case .success(let response):
            self.cityWeatherList = [response]
            print(response)
            
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchCurrentLocationWeather() {
            guard locationService.authorizationStatus == .authorizedWhenInUse else {
                errorMessage = "Location permission not granted."
                return
            }
            
//            isLoading = true
//            locationService.getCurrentLocation()
//                .flatMap { [weak self] location -> AnyPublisher<WeatherResponse, Error> in
//                    self?.weatherService.fetchWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude) ?? Fail(error: URLError(.unknown)).eraseToAnyPublisher()
//                }
//                .map { WeatherDisplayModel(from: $0) }
//                .catch { Just(WeatherDisplayModel(error: $0.localizedDescription)) }
//                .sink { [weak self] model in
//                    self?.weatherModel = model
//                    self?.isLoading = false
//                }
//                .store(in: &cancellables)
        }
        
        func requestLocationPermissionAndFetch() {
            if locationService.authorizationStatus == .notDetermined {
                locationService.requestWhenInUseAuthorization()
                // Wait for delegate callback → handled in locationManagerDidChangeAuthorization
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                    if self?.locationService.authorizationStatus == .authorizedWhenInUse {
                        self?.fetchCurrentLocationWeather()
                    }
                }
            } else if locationService.authorizationStatus == .authorizedWhenInUse {
                fetchCurrentLocationWeather()
            }
        }
    
}
