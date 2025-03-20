//
//  WeatherDetailItemManager.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 20/03/2025.
//

import Foundation

class WeatherDetailItemManager: ObservableObject {
    
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
    
    // Convert timestamp to readable hour format
    func formatHour(_ timestamp: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func extractDailyForecast(from list: [WeatherEntry]) -> [DailyWeatherData] {
        var dailyForecast: [DailyWeatherData] = []
        var lastDate: String = ""
        
        for entry in list {
            let day = formatDate(entry.dt)
            
            if day != lastDate { // Ensures only one entry per day
                lastDate = day
                dailyForecast.append(DailyWeatherData(
                    day: day,
                    minTemp: Int(entry.main.temp_min),
                    maxTemp: Int(entry.main.temp_max),
                    icon: getWeatherIcon(entry.weather.first?.main ?? "Clear")
                ))
            }
        }
        
        return dailyForecast
    }
    
}
