//
//  DailyWeatherModel.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 20/03/2025.
//

import SwiftUI

// MARK: - DAILY WEATHER MODEL

struct DailyWeatherData {
    let day: String
    let minTemp: Int
    let maxTemp: Int
    let icon: String
}

func formatDate(_ timestamp: Int) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
}

func getWeatherIcon(_ condition: String) -> String {
    switch condition.lowercased() {
    case "clear": return "sun.max.fill"
    case "clouds": return "cloud.fill"
    case "rain": return "cloud.rain.fill"
    default: return "questionmark.circle"
    }
}
