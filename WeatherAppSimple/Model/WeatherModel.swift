//
//  WeatherModel.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

// MARK: - WEATHER MODEL

struct Weather: Codable {
    let cod: String
    let message, cnt: Int
    let list: [WeatherEntry]
    let city: City
}

// MARK: - WeatherEntry
struct WeatherEntry: Codable {
    let dt: Int
    let main: MainWeather
    let weather: [WeatherCondition]
}

// MARK: - MainWeather
struct MainWeather: Codable {
    let temp, temp_min, temp_max: Double
}

// MARK: - WeatherCondition
struct WeatherCondition: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coordinates
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lon: Double
}
