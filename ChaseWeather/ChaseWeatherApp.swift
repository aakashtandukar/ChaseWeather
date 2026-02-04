//
//  ChaseWeatherApp.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/2/26.
//

import SwiftUI

@main
struct ChaseWeatherApp: App {
    
    @StateObject private var coordinator: MainCoordinator
    
    init() {
        _coordinator = StateObject(wrappedValue: MainCoordinator())
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(.home)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.build(route)
                    }
            }
        }
    }
}
