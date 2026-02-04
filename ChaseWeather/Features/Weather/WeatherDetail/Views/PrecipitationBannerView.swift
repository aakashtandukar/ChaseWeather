//
//  BannerView.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

struct PrecipitationBanner: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.ultraThinMaterial)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: "umbrella.fill")
                    Text("PRECIPITATION")
                        .bold()
                }
                .foregroundColor(.white.opacity(0.8))
            )
    }
}
