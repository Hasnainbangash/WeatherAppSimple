//
//  WeatherView.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 18/03/2025.
//

import SwiftUI

struct WeatherView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @StateObject var cityManager: AddCityManager = AddCityManager()
    
    @FetchRequest(entity: CityDetails.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \CityDetails.name, ascending: true)]) var cityDetails: FetchedResults<CityDetails>
    
    @State var showAddCityView: Bool = false
    
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.cityDetails, id: \.self) { cityDetails in
                    WeatherItemView()
                        .listRowInsets(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .listRowSeparator(.hidden)
                }
            } //: LIST
            .navigationBarTitle("Weather", displayMode: .large)
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Action
                        self.showAddCityView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                    })
                    .sheet(isPresented: $showAddCityView) {
                        AddCityView(cityManager: cityManager)
                    }
                }
            }
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    let context = PersistenceController.shared.container.viewContext
    WeatherView()
        .environment(\.managedObjectContext, context)
        .preferredColorScheme(.dark)
}
