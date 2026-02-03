//
//  Secrets.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

enum SecretKey: String, CaseIterable {
    case apiBaseURL = "API_BASE_URL"
    case weatherApiKey  = "WEATHER_API_KEY"
}

enum Secrets {
    static func getValueFor(_ key: SecretKey) -> String {
        guard let value = Bundle.main.object(
            forInfoDictionaryKey: key.rawValue
        ) as? String,
        !value.isEmpty else {
            fatalError("Missing secret: \(key.rawValue)")
        }
        return value
    }
    
    static func verifyAllSecretsExist() {
            var missing: [SecretKey] = []
            
            for key in SecretKey.allCases {
                guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String,
                      !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                    missing.append(key)
                    continue
                }
            }
            
            if !missing.isEmpty {
                let missingKeys = missing.map { $0.rawValue }.joined(separator: ", ")
                fatalError("Missing or empty secrets in Info.plist: \(missingKeys)")
            }
        }
}
