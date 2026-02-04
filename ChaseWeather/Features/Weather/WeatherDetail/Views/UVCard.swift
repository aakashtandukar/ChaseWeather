//
//  UVCard.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI

struct UVCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("UV INDEX")
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
            
            Text("0")
                .font(.system(size: 40, weight: .light))
                .foregroundColor(.white)
            
            Text("Low")
                .foregroundColor(.white)
            
            LinearGradient(colors: [.green, .yellow, .orange, .pink],
                           startPoint: .leading,
                           endPoint: .trailing)
                .frame(height: 6)
                .cornerRadius(3)
            
            Text("Low for the rest of the day.")
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
        .frame(height: 180)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
    }
}
