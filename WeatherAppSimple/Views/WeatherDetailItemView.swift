//
//  WeatherDetailView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherDetailItemView: View {
    // MARK: - PPROPERTIES
    
    var cityName: String
    @StateObject private var weatherFetcher = WeatherFetch()
    
    // MARK: - FUNCTIONS
    
    // Convert timestamp to readable hour format
    func formatHour(_ timestamp: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    // Map weather condition to SF Symbols icon
    func getWeatherIcon(_ condition: String) -> String {
        switch condition.lowercased() {
        case "clear":
            return "sun.max.fill"
        case "clouds":
            return "cloud.fill"
        case "rain":
            return "cloud.rain.fill"
        default:
            return "questionmark.circle"
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            Image("WeatherImage1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // MARK: - HEADER VIEW
                    Section {
                        HStack(alignment: .center) {
                            Spacer()
                            WeatherDetailHeaderView(cityName: cityName)
                            Spacer()
                        } //: HSTACK
                    } //: SECTION
                    
                    Spacer(minLength: 30)
                    
                    // MARK: - HOURLY WEATHER VIEW
                    if let weather = weatherFetcher.weather {
                        let hourlyData = weather.list.prefix(8).map { forecast in
                            WeatherHourData(
                                hour: formatHour(forecast.dt),
                                temp: Int(forecast.main.temp),
                                icon: getWeatherIcon(forecast.weather[0].main)
                            )
                        }
                        HourlyWeatherView(hourlyData: hourlyData)
                    }
                    
                    // MARK: - TEN DAYS WEATHER VIEW
                    TenDayWeatherView()
                    
                } //: VSTACK
                .padding()
            } //: SCROLL
        } //: ZSTACK
        .onAppear {
            weatherFetcher.fetchWeather(cityName: cityName)
        }
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherDetailItemView(cityName: "Wah")
        .preferredColorScheme(.dark)
}
