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
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                    
                    Text("2:25 PM")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                } //: VSTACK
                
                Spacer()
                
                Text("26°")
                    .font(.system(size: 53, weight: .light, design: .rounded))
                    .foregroundColor(Color.white)
            } //: HSTACK
            
            HStack {
                Text("Sunny")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                
                Spacer()
                
                Text("H:26° L:11°")
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

#Preview {
    WeatherItemView()
        .padding()
        .preferredColorScheme(.dark)
}
