//
//  CityNameList.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

struct CityName : Identifiable, Hashable {
    let id = UUID()
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    let state: String
}

struct CityNameList {
    
    var cityNameList: [CityName] = []
    
    init?(from response: CityNameListResponse) {
        for data in response {
            let city = CityName(name: data.name, lat: data.lat ?? 0, lon: data.lon ?? 0, country: data.country ?? "", state: data.state ?? "")
            cityNameList.append(city)
        }
    }
}
