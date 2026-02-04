//
//  Coordinator.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Combine
import SwiftUI

protocol Coordinator: ObservableObject {
    var path: NavigationPath { get set }
    func push(_ flow: Route)
    func pop()
    func popToRoot()
}
