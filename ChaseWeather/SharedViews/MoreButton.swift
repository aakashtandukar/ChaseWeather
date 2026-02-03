//
//  MoreButton.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//
import SwiftUI

struct MoreButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "ellipsis.circle")
                .font(.title3)
        }
    }
}
