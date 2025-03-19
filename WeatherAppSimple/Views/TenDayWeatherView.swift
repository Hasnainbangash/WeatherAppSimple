//
//  TenDayWeatherView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct TenDayWeatherView: View {
    // MARK: - PROPERTIES
    
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
                
                WeatherRowView()
                WeatherRowView()
                WeatherRowView()
                WeatherRowView()
                WeatherRowView()
                WeatherRowView()
                WeatherRowView()
                WeatherRowView()
                WeatherRowView()
                WeatherRowView()
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
    TenDayWeatherView()
        .preferredColorScheme(.dark)
}
