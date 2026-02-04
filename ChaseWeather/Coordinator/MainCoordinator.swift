//
//  MainCoordinator.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation
import SwiftUI
import Combine


@MainActor
final class MainCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()

    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    @ViewBuilder
    func build(_ route: Route) -> some View {
        switch route {
        case .home:
            WeatherHomeView(viewModel: WeatherHomeViewModel(repository: WeatherRepository(apiService: ApiService()), coordinator: self))
            
        case .cityDetail(let cityWeather):
            WeatherDetailView(cityWeather: cityWeather)
        }
    }
}
