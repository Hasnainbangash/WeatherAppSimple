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
    
    var body: some View {
        TabView {
            ForEach(cityDetails, id: \.self) { cityDetails in
                WeatherDetailItemView(cityName: cityDetails.name ?? "Wah")
            }
        }
        .tabViewStyle(.page)
        .edgesIgnoringSafeArea(.all)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                // ACTION
            }, label: {
                Image(systemName: "list.dash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 27, height: 27, alignment: .center)
            })
            .accentColor(Color.white)
            .padding()
        }
    }
}

#Preview {
    let context = PersistenceController.shared.container.viewContext
    ContentView()
        .environment(\.managedObjectContext, context)
        .preferredColorScheme(.dark)
}
