//
//  WeatherItemView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherItemView: View {
    // MARK: - PROPERTIES
    
    var cityName: String
    @StateObject private var weatherFetcher = WeatherFetch()
    
    // MARK: - FUNCTIONS
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: Date())
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 25) {
            if let weather = weatherFetcher.weather {
                HStack {
                    VStack(alignment: .leading) {
                        Text(weather.city.name)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                        
                        Text(getCurrentTime())
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                    }
                    
                    Spacer()
                    
                    Text("\(Int(weather.list[0].main.temp))°")
                        .font(.system(size: 53, weight: .light, design: .rounded))
                        .foregroundColor(Color.white)
                }
                
                HStack {
                    Text(weather.list[0].weather[0].main)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                    
                    Spacer()
                    
                    Text("H:\(Int(weather.list[0].main.temp_max))° L:\(Int(weather.list[0].main.temp_min))°")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                }
            } else {
                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .cornerRadius(10)
        .background(
            Image("WeatherImage")
                .resizable()
                .opacity(0.5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 370, height: 140)
        )
        .onAppear {
            weatherFetcher.fetchWeather(cityName: cityName)
        }
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherItemView(cityName: "Wah")
        .padding()
        .preferredColorScheme(.dark)
}
