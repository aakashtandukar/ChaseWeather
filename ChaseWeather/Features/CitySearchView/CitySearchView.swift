//
//  CitySearchView.swift
//  ChaseWeather
//
//  Created by aakash tandukar on 2/3/26.
//

import SwiftUI


// MARK: - Search View (Weather App Style)
struct CitySearchView: View {
    @Binding var isPresented: Bool
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    @State private var recentSearches = ["New York", "Los Angeles", "Chicago"]
    
    // Sample cities for search results
    let cities = [
        "San Francisco", "New York", "Los Angeles", "Chicago",
        "Houston", "Phoenix", "Philadelphia", "San Antonio",
        "San Diego", "Dallas", "Austin", "Jacksonville",
        "Fort Worth", "Columbus", "Charlotte", "Seattle",
        "Denver", "Boston", "Portland", "Las Vegas"
    ]
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return []
        }
        return cities.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(UIColor.systemBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Custom Search Bar
                    HStack(spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.secondary)
                            
                            TextField("Search for a city or airport", text: $searchText)
                                .focused($isSearchFocused)
                                .autocorrectionDisabled()
                            
                            if !searchText.isEmpty {
                                Button {
                                    searchText = ""
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .padding(10)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        
                        Button("Cancel") {
                            isPresented = false
                        }
                        .foregroundStyle(.blue)
                    }
                    .padding()
                    
                    // Search Results or Recent Searches
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            if searchText.isEmpty {
                                // Recent Searches Section
                                if !recentSearches.isEmpty {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Recent")
                                            .font(.headline)
                                            .foregroundStyle(.secondary)
                                            .padding(.horizontal)
                                            .padding(.vertical, 8)
                                        
                                        ForEach(recentSearches, id: \.self) { city in
                                            RecentSearchRow(city: city) {
                                                selectCity(city)
                                            } onDelete: {
                                                removeRecentSearch(city)
                                            }
                                        }
                                    }
                                }
                            } else {
                                // Search Results
                                if searchResults.isEmpty {
                                    VStack(spacing: 12) {
                                        Image(systemName: "magnifyingglass")
                                            .font(.system(size: 50))
                                            .foregroundStyle(.tertiary)
                                        
                                        Text("No Results")
                                            .font(.title3)
                                            .foregroundStyle(.secondary)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.top, 100)
                                } else {
                                    ForEach(searchResults, id: \.self) { city in
                                        SearchResultRow(city: city) {
                                            selectCity(city)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.top, 8)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            // Auto-focus search field when view appears
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isSearchFocused = true
            }
        }
    }
    
    private func selectCity(_ city: String) {
        // Add to recent searches if not already there
        if let index = recentSearches.firstIndex(of: city) {
            recentSearches.remove(at: index)
        }
        recentSearches.insert(city, at: 0)
        
        // Keep only last 5 searches
        if recentSearches.count > 5 {
            recentSearches = Array(recentSearches.prefix(5))
        }
        
        // Dismiss and handle selection
        isPresented = false
    }
    
    private func removeRecentSearch(_ city: String) {
        recentSearches.removeAll { $0 == city }
    }
}

// MARK: - Recent Search Row
struct RecentSearchRow: View {
    let city: String
    let onTap: () -> Void
    let onDelete: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Image(systemName: "clock")
                    .foregroundStyle(.secondary)
                    .frame(width: 24)
                
                Text(city)
                    .foregroundStyle(.primary)
                
                Spacer()
                
                Button(action: onDelete) {
                    Image(systemName: "xmark")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Search Result Row
struct SearchResultRow: View {
    let city: String
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                    .frame(width: 24)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(city)
                        .foregroundStyle(.primary)
                    
                    Text("United States")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}
