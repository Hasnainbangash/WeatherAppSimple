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

    var body: some View {
        TabView {
            ForEach(1...3, id: \.self) { _ in
                WeatherDetailItemView(cityName: "Wah")
            }
        }
        .tabViewStyle(.page)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    let context = PersistenceController.shared.container.viewContext
    ContentView()
        .environment(\.managedObjectContext, context)
        .preferredColorScheme(.dark)
}
