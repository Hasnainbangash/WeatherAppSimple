//
//  WeatherRowView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct WeatherRowView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        HStack(spacing: 20) {
            // MARK: - WEATHER WEEKDAY
            Text("TODAY")
                .font(.system(size: 22, weight: .medium, design: .rounded))
            
            // MARK: - WEATHER IMAGE
            Image(systemName: "sun.max")
                .resizable()
                .foregroundColor(Color.yellow)
                .frame(width: 28, height: 26, alignment: .center)
            
            // MARK: - WEATHER MINIMUM TEMPERATURE
            Text("15°")
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .foregroundColor(Color.gray)
            
            TemperatureRangeView(minTemp: 15, maxTemp: 29)
            
            Text("15°")
                .font(.system(size: 22, weight: .medium, design: .rounded))
        } //: HSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherRowView()
        .preferredColorScheme(.dark)
}
