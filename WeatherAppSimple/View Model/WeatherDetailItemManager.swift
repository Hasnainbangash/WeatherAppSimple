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
    
}
