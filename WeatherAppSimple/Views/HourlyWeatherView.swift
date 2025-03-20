//
//  HourlyWeatherView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct HourlyWeatherView: View {
    // MARK: - PROPERTIES
    
    var hourlyData: [WeatherHourData]
    
    // MARK: - BODY
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading, spacing: 20) {
                // Forecast summary text
                Text("Cloudy conditions from 1AM - 9AM, with showers expected at 9AM.")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.white)
                
                Divider()
                
                // Hourly weather forecast
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(hourlyData, id: \.hour) { data in
                            WeatherHourView(hour: data.hour, temp: data.temp, icon: data.icon)
                        } //: LOOP
                    } //: HSTACK
                    .padding()
                } //: SCROLL
            } //: VSTACK
        } //: GROUPBOX
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1)
                .cornerRadius(15)
        )
    }
}

// MARK: - PREVIEW

#Preview {
    HourlyWeatherView(hourlyData: [
        WeatherHourData(hour: "1 AM", temp: 21, icon: "cloud.sun"),
        WeatherHourData(hour: "2 AM", temp: 20, icon: "cloud.sun.rain"),
        WeatherHourData(hour: "3 AM", temp: 19, icon: "cloud.rain")
    ])
    .preferredColorScheme(.dark)
}
