//
//  WeatherHourlyView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct WeatherHourlyView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Now")
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            
            Image(systemName: "cloud")
                .font(.title2)
                .foregroundColor(.white)
            
            Text("21°")
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        } //: VSTACK
        .frame(maxWidth: .infinity)
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherHourlyView()
        .preferredColorScheme(.dark)
}
