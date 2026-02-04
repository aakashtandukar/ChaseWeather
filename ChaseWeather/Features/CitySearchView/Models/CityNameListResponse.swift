//
//  CitynameListResponse.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import Foundation

// MARK: - Top Level (Array)
typealias CityNameListResponse = [City]

struct City: Codable {
    let name: String
    let localNames: LocalNames?
    let lat: Double?
    let lon: Double?
    let country: String?
    let state: String?

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat
        case lon
        case country
        case state
    }
}

struct LocalNames: Codable {
    let de: String?
    let featureName: String?
    let ja: String?
    let ru: String?
    let vi: String?
    let ascii: String?
    let en: String?
    let fr: String?
    let zh: String?
    let es: String?
    let bg: String?

    enum CodingKeys: String, CodingKey {
        case de
        case featureName = "feature_name"
        case ja
        case ru
        case vi
        case ascii
        case en
        case fr
        case zh
        case es
        case bg
    }
}
