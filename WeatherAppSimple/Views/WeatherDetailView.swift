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
        List {
            // MARK: - HEADER
            Section {
                HStack(alignment: .center) {
                    Spacer()
                    WeatherDetailHeaderView()
                    Spacer()
                }
            }
            
        } //: LIST
    }
}

// MARK: - PREVIEW

#Preview {
    WeatherDetailView()
        .preferredColorScheme(.dark)
}
