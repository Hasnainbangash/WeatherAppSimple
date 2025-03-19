//
//  AddCityView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI

struct AddCityView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    @State var cityName: String = ""
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
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
                } //: BUTTON
                .padding(.horizontal)
                
                Spacer()
            } //: VSTACK
            .navigationTitle("Enter City Name")
            .padding(.top, 20)
        }
    }
}

// MARK: - PREVIEW

#Preview {
    let context = PersistenceController.shared.container.viewContext
    AddCityView()
        .environment(\.managedObjectContext, context)
        .preferredColorScheme(.dark)
}
