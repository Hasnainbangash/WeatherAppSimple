//
//  WeatherDetailView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherDetailItemView: View {
    // MARK: - PROPERTIES
    
    var cityName: String
    @StateObject private var weatherFetcher = WeatherFetch()
    @State private var weatherDetailManager = WeatherDetailItemManager()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showCloseIcon: Bool
       
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            Image("WeatherImage1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - LOADING INDICATOR
            if weatherFetcher.isLoading {
                VStack {
                    ProgressView() // <-- DEFAULT SWIFTUI LOADING INDICATOR
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5) // Make it larger
                        .padding()
                    
                    Text("Fetching weather...")
                        .foregroundColor(.white)
                        .font(.headline)
                }
            } else {
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
                                    hour: weatherDetailManager.formatHour(forecast.dt),
                                    temp: Int(forecast.main.temp),
                                    icon: weatherDetailManager.getWeatherIcon(forecast.weather[0].main)
                                )
                            }
                            HourlyWeatherView(hourlyData: hourlyData)
                        }
                        
                        // MARK: - TEN DAYS WEATHER VIEW
                        if let weather = weatherFetcher.weather {
                            let dailyData = extractDailyForecast(from: weather.list)
                            TenDayWeatherView(dailyForecast: dailyData)
                        }
                        
                    } //: VSTACK
                    .padding()
                } //: SCROLL
            }
        } //: ZSTACK
        .overlay(alignment: .topTrailing) {
            Button(action: {
                // MARK: - CLOSE BUTTON ACTION
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .opacity(showCloseIcon ? 1 : 0)
                    .frame(width: 20, height: 20, alignment: .center)
            }
            .padding()
            .accentColor(Color.white)
        }
        .onAppear {
            // MARK: - FETCH WEATHER DATA
            weatherFetcher.fetchWeather(cityName: cityName)
        }
        .animation(.easeInOut(duration: 1.5))
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherDetailItemView(cityName: "Wah", showCloseIcon: true)
        .preferredColorScheme(.dark)
}
