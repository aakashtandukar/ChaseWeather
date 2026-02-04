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
    
    fileprivate let repository: WeatherRepositoryProtocol
    fileprivate weak var coordinator: MainCoordinator?
    private var cancellables = Set<AnyCancellable>()
    

    @Published var cityWeatherList: [CityWeather] = []
    
    @Published var errorMessage: String?
    
    
    var locationService = LocationService()
    
    init(repository: WeatherRepositoryProtocol, coordinator: MainCoordinator) {
            self.repository = repository
            self.coordinator = coordinator
        bindLocation()
    }
    
    
    
    func didSelectCity(_ city: CityWeather) {
        coordinator?.push(.cityDetail(city))
    }

    
    func requestLocationAndStart() {
        if locationService.authorizationStatus == .notDetermined {
            locationService.requestWhenInUseAuthorization()
        } else {
            locationService.startLocationUpdates()
        }
    }
    
    
    
    
}


extension WeatherHomeViewModel {
    
    private func bindLocation() {
        let latPublisher = locationService.$latitude
        let lonPublisher = locationService.$longitude

        Publishers.CombineLatest(latPublisher, lonPublisher)
            .drop(while: { lat, lon in lat == 0 && lon == 0 })
            .removeDuplicates(by: { $0.0 == $1.0 && $0.1 == $1.1 })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] lat, lon in
                print("New Location:", lat, lon)
                Task {
                    await self?.loadWeather(lat: lat, lon: lon)
                }
            }
            .store(in: &cancellables)
    }
    
    
    private func loadWeather(lat: Double, lon: Double) async {
            switch await repository.getCityWeather(latitude: lat, longitude: lon) {
            case .success(let weather):
                cityWeatherList = [weather]

            case .failure(let error):
                errorMessage = error.localizedDescription
            }
    }
    
}
