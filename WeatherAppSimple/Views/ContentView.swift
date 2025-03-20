//
//  ContentView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: CityDetails.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \CityDetails.name, ascending: true)]) var cityDetails: FetchedResults<CityDetails>
    
    @State private var showWeatherView = false
    
    var body: some View {
        TabView {
            ForEach(cityDetails, id: \.self) { cityDetails in
                WeatherDetailItemView(cityName: cityDetails.name ?? "Wah")
            } //: LOOP
        } //: TAB VIEW
        .tabViewStyle(.page)
        .edgesIgnoringSafeArea(.all)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                self.showWeatherView.toggle()
            }) {
                Image(systemName: "list.dash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .fullScreenCover(isPresented: $showWeatherView) {
            WeatherView()
        }
    }
}

#Preview {
    let context = PersistenceController.shared.container.viewContext
    ContentView()
        .environment(\.managedObjectContext, context)
        .preferredColorScheme(.dark)
}
