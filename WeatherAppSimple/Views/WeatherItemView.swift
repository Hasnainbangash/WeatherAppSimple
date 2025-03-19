//
//  WeatherItemView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherItemView: View {
    // MARK: - PROPERTIES
    
    let weather: Weather = Bundle.main.decode("WeatherData.json")
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                VStack(alignment: .leading) {
                    Text(weather.city.name)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                    
                    Text("2:25 PM")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                } //: VSTACK
                
                Spacer()
                
                Text("\(Int(weather.list[0].main.temp))°")
                    .font(.system(size: 53, weight: .light, design: .rounded))
                    .foregroundColor(Color.white)
            } //: HSTACK
            
            HStack {
                Text(weather.list[0].weather[0].main)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                
                Spacer()
                
                Text("H:\(Int(weather.list[0].main.temp_min))° L:\(Int(weather.list[0].main.temp_max))°")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
            } //: HSTACK
        } //: VSTACK
        .padding()
        .cornerRadius(10)
        .background(
            Image("WeatherImage")
                .resizable()
                .opacity(0.5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 370, height: 140)
        )
    }
}

// MARK: - PREVIEW

#Preview {
    // let weatherData: Weather = Bundle.main.decode("WeatherData.json")
    WeatherItemView()
        .padding()
        .preferredColorScheme(.dark)
}
