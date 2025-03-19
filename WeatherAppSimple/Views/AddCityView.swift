//
//  AddCityView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct AddCityView: View {
    // MARK: - PROPERTIES
    @State var cityName: String = ""
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Enter City Name")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("City Name", text: $cityName)
                .font(.system(size: 22))
                .padding()
                .frame(height: 60)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
                .padding(.horizontal)
            
            Button(action: {
                print("City Added: \(cityName)")
            }) {
                Text("Add City")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - PREVIEW

#Preview {
    AddCityView()
        .preferredColorScheme(.dark)
}
