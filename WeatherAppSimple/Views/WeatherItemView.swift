//
//  WeatherItemView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherItemView: View {
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Hassan Abdal")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                    
                    Text("2:25 PM")
                        .fontWeight(.semibold)
                } //: VSTACK
                
                Spacer()
                
                Text("26°")
                    .font(.system(size: 50, weight: .medium, design: .rounded))
                    .foregroundColor(Color.white)
            } //: HSTACK
            
            HStack {
                Text("Sunny")
                
                Spacer()
                
                Text("H:26° L:11°")
            } //: HSTACK
        } //: VSTACK
    }
}

#Preview {
    WeatherItemView()
        .padding()
        .preferredColorScheme(.dark)
}
