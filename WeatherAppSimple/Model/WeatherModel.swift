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
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dt_txt: String
}

// MARK: - MainWeather
struct MainWeather: Codable {
    let temp, feels_like, temp_min, temp_max: Double
    let pressure, sea_level, grnd_level, humidity: Int
}

// MARK: - WeatherCondition
struct WeatherCondition: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

// MARK: - Sys
struct Sys: Codable {
    let pod: String
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
