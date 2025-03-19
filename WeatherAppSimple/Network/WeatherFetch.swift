import SwiftUI

struct WeatherFetch {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast?appid=41c7c8a410b7f880b4ce8425ffc6695c&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Request failed: \(error)")
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        print("Weather data fetched successfully: \(weather)")
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> Weather? {
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
