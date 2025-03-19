//
//  TemperatureRangeView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct TemperatureRangeView: View {
    // MARK: - PROPERTIES
    
    var minTemp: Int
    var maxTemp: Int
    
    // MARK: - BODY
    
    var body: some View {
        GeometryReader { geometry in
            let totalRange: CGFloat = 50
            let width = CGFloat(maxTemp - minTemp) / totalRange * geometry.size.width
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.black.opacity(0.3))
                    .frame(height: 5)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: width, height: 5)
            } //: ZSTACK
        } //: GEOMETRY
        .frame(width: 100, height: 5)
    }
}

// MARK: - PREVIEW

#Preview {
    TemperatureRangeView(minTemp: 15, maxTemp: 30)
        .preferredColorScheme(.light)
}
