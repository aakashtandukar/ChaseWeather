//
//  File.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

struct InfoGrid: View {
    var body: some View {
        HStack(spacing: 16) {
            WeatherCard(title: "FEELS LIKE",
                        bigValue: "-12°",
                        description: "Wind is making it feel colder.")
            
            UVCard()
        }
    }
}
