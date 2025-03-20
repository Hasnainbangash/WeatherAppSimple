//
//  WeatherHourlyView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct WeatherHourView: View {
    // MARK: - PROPERTIES
    
    var hour: String
    var temp: Int
    var icon: String
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(hour)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
            
            Text("\(temp)°")
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        } //: VSTACK
        .frame(maxWidth: .infinity)
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherHourView(hour: "Now", temp: 21, icon: "cloud.sun.fill")
        .preferredColorScheme(.dark)
}
