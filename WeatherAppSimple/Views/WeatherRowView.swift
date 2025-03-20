//
//  WeatherRowView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct WeatherRowView: View {
    // MARK: - PROPERTIES
    
    var forecast: DailyWeatherData
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            HStack {
                // Weekday Name
                Text(forecast.day)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .frame(width: 90, alignment: .leading)
                
                // Weather Icon
                Image(systemName: forecast.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.yellow)
                
                // Min Temperature
                Text("\(forecast.minTemp)°")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
                    .frame(width: 40, alignment: .trailing)
                
                // Temperature Range View (Adjusted Width)
                TemperatureRangeView(minTemp: forecast.minTemp, maxTemp: forecast.maxTemp)
                    .frame(maxWidth: .infinity)
                
                // Max Temperature
                Text("\(forecast.maxTemp)°")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .frame(width: 40, alignment: .leading)
            }
            .padding(.vertical, 12) // Even spacing around the row
            
            Divider()
                .background(Color.gray.opacity(0.4)) // Softer divider line
        }
        .padding(.horizontal)
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherRowView(forecast: DailyWeatherData(day: "Monday", minTemp: 15, maxTemp: 25, icon: "sun.max.fill"))
        .preferredColorScheme(.dark)
}
