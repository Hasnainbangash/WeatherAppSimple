//
//  HourlyWeatherView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct HourlyWeatherView: View {
    // MARK: - PROPERTIES
    
    
    
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
                HStack {
                    WeatherHourView()
                    WeatherHourView()
                    WeatherHourView()
                    WeatherHourView()
                    WeatherHourView()
                } //: HSTACK
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
    HourlyWeatherView()
        .preferredColorScheme(.dark)
}
