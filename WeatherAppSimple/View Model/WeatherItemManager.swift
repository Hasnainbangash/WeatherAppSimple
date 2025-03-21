//
//  WeatherItemManager.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 20/03/2025.
//

import SwiftUI

class WeatherItemManager: ObservableObject {
    
    @Published var weatherFetch = WeatherFetch()
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: Date())
    }
    
    func fetchingWeather(cityName: String) {
        weatherFetch.fetchWeather(cityName: cityName)
    }
    
}
