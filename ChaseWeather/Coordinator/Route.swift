//
//  Route.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

enum Route: Hashable {
    case home
    case cityDetail(CityWeather)
}
