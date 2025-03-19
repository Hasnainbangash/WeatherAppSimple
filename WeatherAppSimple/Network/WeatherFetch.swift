//
//  WeatherFetch.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

class WeatherFetch: ObservableObject {
    
    @Published var weather: Weather?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast?appid=41c7c8a410b7f880b4ce8425ffc6695c&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? cityName)"
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Request failed: \(error)")
                return
            }
            
            if let safeData = data {
                DispatchQueue.main.async {
                    self?.weather = self?.parseJSON(safeData)
                }
            }
        }
        task.resume()
    }
    
    private func parseJSON(_ weatherData: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Weather.self, from: weatherData)
            return decodedData
        } catch {
            print("JSON decoding error: \(error)")
            return nil
        }
    }
}
