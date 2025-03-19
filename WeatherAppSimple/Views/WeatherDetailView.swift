//
//  WeatherDetailView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherDetailView: View {
    // MARK: - PPROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            Image("WeatherImage1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // MARK: - HEADER VIEW
                    Section {
                        HStack(alignment: .center) {
                            Spacer()
                            WeatherDetailHeaderView()
                            Spacer()
                        } //: HSTACK
                    } //: SECTION
                    
                    // MARK: - HOURLY WEATHER VIEW
                    HourlyWeatherView()
                    
                    TenDayWeatherView()
                    
                } //: VSTACK
                .padding()
            } //: SCROLL
        } //: ZSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherDetailView()
        .preferredColorScheme(.dark)
}
