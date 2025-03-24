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
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var cityManager: AddCityManager
    @State var cityName: String = ""
    @State private var showAlert: Bool = false
    
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
                    cityManager.addCity(context: self.viewContext, name: cityName)
                    showAlert = true
                }) {
                    Text("Add City")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                } //: BUTTON
                .padding(.horizontal)
                .alert("City Added", isPresented: $showAlert) {
                    Button("OK") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                } message: {
                    Text("\(cityName) has been added successfully.")
                }
                
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
    AddCityView(cityManager: AddCityManager())
        .environment(\.managedObjectContext, context)
        .preferredColorScheme(.dark)
}
