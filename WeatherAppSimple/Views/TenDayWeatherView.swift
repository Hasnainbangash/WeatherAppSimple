//
//  TenDayWeatherView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct TenDayWeatherView: View {
    // MARK: - PROPERTIES
    
    var dailyForecast: [DailyWeatherData]
    
    // MARK: - BODY
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading, spacing: 15) {
                // Forecast summary text
                HStack {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 19, height: 18, alignment: .center)
                    
                    Text("10-DAY FORECAST")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.white)
                } //: HSTACK
                
                Divider()
                
                ForEach(dailyForecast, id: \.day) { forecast in
                    WeatherRowView(forecast: forecast)
                }
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
    TenDayWeatherView(dailyForecast: [
        DailyWeatherData(day: "Monday", minTemp: 15, maxTemp: 25, icon: "sun.max.fill"),
        DailyWeatherData(day: "Tuesday", minTemp: 16, maxTemp: 26, icon: "cloud.fill"),
        DailyWeatherData(day: "Wednesday", minTemp: 17, maxTemp: 27, icon: "cloud.rain.fill"),
        DailyWeatherData(day: "Thursday", minTemp: 14, maxTemp: 24, icon: "wind"),
    ])
    .preferredColorScheme(.dark)
    .preferredColorScheme(.dark)
}
