//
//  CityNameListViewModel.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation
import Combine
import CoreLocation

@MainActor
class CityNameListViewModel: ObservableObject {
    
    private let repository: WeatherRepositoryProtocol
    @Published var cityNameList: [CityNameList] = []
    
    init(repository: WeatherRepositoryProtocol) {
            self.repository = repository
            Secrets.verifyAllSecretsExist()
        
    }
    
    func getCityNameListData(query: String) async {
        let url = Secrets.getValueFor(.apiBaseURL)
        print(url)
        
        switch await repository.getCityList(query: query) {
        case .success(let response):
            self.cityNameList = [response]
            print(response)
            
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
}
