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
            
            Image("WeatherImage1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            List {
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
                
            } //: LIST
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            .background(Color.clear)
        } //: ZSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherDetailView()
        .preferredColorScheme(.dark)
}
