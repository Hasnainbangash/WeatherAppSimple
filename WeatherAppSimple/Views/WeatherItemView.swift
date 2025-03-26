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
    @StateObject private var weatherItemManager = WeatherItemManager()
    
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 25) {
            if let weather = weatherFetcher.weather {
                HStack {
                    VStack(alignment: .leading) {
                        Text(weather.city.name)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                            .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.5), value: isAnimating)
                            .offset(y: isAnimating ? 0 : -50)
                            .opacity(isAnimating ? 1 : 0)
                            .onAppear {
                                self.isAnimating = true
                            }
                        
                        Text(weatherItemManager.getCurrentTime())
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.5), value: isAnimating)
                            .offset(y: isAnimating ? 0 : -50)
                            .opacity(isAnimating ? 1 : 0)
                    } //: VSTACK
                    
                    Spacer()
                    
                    Text("\(Int(weather.list[0].main.temp))°")
                        .font(.system(size: 53, weight: .light, design: .rounded))
                        .foregroundColor(Color.white)
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.5), value: isAnimating)
                        .offset(y: isAnimating ? 0 : -50)
                        .opacity(isAnimating ? 1 : 0)
                } //: HSTACK
                
                HStack {
                    Text(weather.list[0].weather[0].main)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.5), value: isAnimating)
                        .offset(y: isAnimating ? 0 : -50)
                        .opacity(isAnimating ? 1 : 0)
                    
                    Spacer()
                    
                    Text("H:\(Int(weather.list[0].main.temp_max))° L:\(Int(weather.list[0].main.temp_min))°")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.5), value: isAnimating)
                        .offset(y: isAnimating ? 0 : -50)
                        .opacity(isAnimating ? 1 : 0)
                } //: HSTACK
            } else {
                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        } //: VSTACK
        .padding()
        .cornerRadius(10)
        .background(
            ZStack {
                Image("WeatherImage")
                    .resizable()
                    .opacity(0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 370, height: 140)
            }
        )
        .onAppear {
            weatherFetcher.fetchWeather(cityName: cityName)
//            withAnimation {
//                self.isAnimating = true
//            }
        }
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherItemView(cityName: "Wah")
        .padding()
        .preferredColorScheme(.dark)
}
