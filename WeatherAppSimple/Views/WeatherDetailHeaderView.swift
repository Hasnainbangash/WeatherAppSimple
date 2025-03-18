//
//  WeatherDetailHeaderView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherDetailHeaderView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Seongnam-si")
                .font(.largeTitle)
                .fontWeight(.regular)
            
            Text("21°")
                .font(.system(size: 102, weight: .thin, design: .rounded))
            
            Text("Party Cloudy")
                .font(.system(size: 24, weight: .regular, design: .rounded))
            
            Text("H:29° L:15°")
                .font(.system(size: 21, weight: .regular, design: .rounded))
        } //: VSTACK
    }
}

#Preview {
    WeatherDetailHeaderView()
        .preferredColorScheme(.dark)
}
