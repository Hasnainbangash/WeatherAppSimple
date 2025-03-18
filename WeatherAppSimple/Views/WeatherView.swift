//
//  WeatherView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                WeatherItemView()
                    .listRowInsets(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .listRowSeparator(.hidden)

                WeatherItemView()
                    .listRowInsets(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .listRowSeparator(.hidden)
                
                WeatherItemView()
                    .listRowInsets(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .listRowSeparator(.hidden)
                
                WeatherItemView()
                    .listRowInsets(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .listRowSeparator(.hidden)
            } //: LIST
            .navigationBarTitle("Weather", displayMode: .large)
            .listStyle(.plain)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherView()
        .preferredColorScheme(.dark)
}
