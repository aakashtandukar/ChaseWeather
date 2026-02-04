//
//  LocationService.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI
import Combine
import CoreLocation

protocol LocationServiceProtocol {
    var authorizationStatus: CLAuthorizationStatus { get }
    func requestWhenInUseAuthorization()
    func getCurrentLocation() -> AnyPublisher<CLLocation, Error>
}

class LocationService: NSObject, LocationServiceProtocol, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let locationSubject = PassthroughSubject<CLLocation, Error>()
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }
    
    var authorizationStatus: CLAuthorizationStatus {
        locationManager.authorizationStatus
    }
    
    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getCurrentLocation() -> AnyPublisher<CLLocation, Error> {
        locationManager.startUpdatingLocation()
        return locationSubject.eraseToAnyPublisher()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationSubject.send(location)
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
            
            print("Lat:", latitude)
            print("Long:", longitude)
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationSubject.send(completion: .failure(error))
    }
}
