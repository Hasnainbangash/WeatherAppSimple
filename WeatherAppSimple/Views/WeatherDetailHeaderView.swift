//
//  WeatherDetailHeaderView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherDetailHeaderView: View {
    // MARK: - PROPERTIES
    
    var cityName: String
    @StateObject private var weatherFetcher = WeatherFetch()
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center) {
            if let weather = weatherFetcher.weather {
                Text(weather.city.name)
                    .font(.largeTitle)
                    .fontWeight(.regular)
                
                Text("\(Int(weather.list[0].main.temp))°")
                    .font(.system(size: 102, weight: .thin, design: .rounded))
                
                Text(weather.list[0].weather[0].main)
                    .font(.system(size: 24, weight: .regular, design: .rounded))
                
                Text("H:\(Int(weather.list[0].main.temp_max))° L:\(Int(weather.list[0].main.temp_min))°")
                    .font(.system(size: 21, weight: .regular, design: .rounded))
            }
        } //: VSTACK
        .onAppear {
            weatherFetcher.fetchWeather(cityName: cityName)
        }
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherDetailHeaderView(cityName: "Wah")
        .preferredColorScheme(.dark)
}
