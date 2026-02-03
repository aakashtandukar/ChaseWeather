//
//  ApiServiceProtocol.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

protocol ApiServiceProtocol {
    
    func request<T: Decodable, Endpoint: ApiEndPoint>(_ endpoint: Endpoint) async -> Result<T, ApiError>
}
