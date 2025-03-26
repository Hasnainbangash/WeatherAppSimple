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
    
    @State private var nameAnimating: Bool = false
    @State private var timeAnimating: Bool = false
    @State private var tempAnimating: Bool = false
    @State private var weatherConditionAnimating: Bool = false
    @State private var HLTempAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 25) {
            if let weather = weatherFetcher.weather {
                HStack {
                    VStack(alignment: .leading) {
                        Text(weather.city.name)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                            .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.7), value: nameAnimating)
                            .offset(y: nameAnimating ? 0 : -50)
                            .opacity(nameAnimating ? 1 : 0)
                            .onAppear {
                                withAnimation {
                                    self.nameAnimating.toggle()
                                }
                            }
                        
                        Text(weatherItemManager.getCurrentTime())
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.7), value: timeAnimating)
                            .offset(y: timeAnimating ? 0 : -50)
                            .opacity(timeAnimating ? 1 : 0)
                            .onAppear {
                                withAnimation {
                                    self.timeAnimating.toggle()
                                }
                            }
                    } //: VSTACK
                    
                    Spacer()
                    
                    Text("\(Int(weather.list[0].main.temp))°")
                        .font(.system(size: 53, weight: .light, design: .rounded))
                        .foregroundColor(Color.white)
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.7), value: tempAnimating)
                        .offset(y: tempAnimating ? 0 : -50)
                        .opacity(tempAnimating ? 1 : 0)
                        .onAppear {
                            withAnimation {
                                self.tempAnimating.toggle()
                            }
                        }
                } //: HSTACK
                
                HStack {
                    Text(weather.list[0].weather[0].main)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.7), value: weatherConditionAnimating)
                        .offset(y: weatherConditionAnimating ? 0 : -50)
                        .opacity(weatherConditionAnimating ? 1 : 0)
                        .onAppear {
                            withAnimation {
                                self.weatherConditionAnimating.toggle()
                            }
                        }
                    
                    Spacer()
                    
                    Text("H:\(Int(weather.list[0].main.temp_max))° L:\(Int(weather.list[0].main.temp_min))°")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6).delay(0.7), value: HLTempAnimating)
                        .offset(y: HLTempAnimating ? 0 : -50)
                        .opacity(HLTempAnimating ? 1 : 0)
                        .onAppear {
                            withAnimation {
                                self.HLTempAnimating.toggle()
                            }
                        }
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
                    .opacity(0.7)
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
