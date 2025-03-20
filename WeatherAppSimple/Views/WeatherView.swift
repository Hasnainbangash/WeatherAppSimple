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
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var cityManager: AddCityManager = AddCityManager()
    
    @FetchRequest(entity: CityDetails.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \CityDetails.name, ascending: true)]) var cityDetails: FetchedResults<CityDetails>
    
    @State var showAddCityView: Bool = false
    @State private var selectedCity: String? = nil
    @State private var showWeatherDetail: Bool = false
    
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.cityDetails, id: \.self) { cityDetails in
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.2)) {
                        WeatherItemView(cityName: cityDetails.name ?? "Wah")
                            .listRowInsets(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.selectedCity = cityDetails.name
                                }
                                
                                self.showWeatherDetail.toggle()
                            }
                    } //: ANIMATION
                } //: LOOP
                .onDelete { indexSet in
                    for index in indexSet {
                        let city = cityDetails[index]
                        cityManager.deleteCity(context: managedObjectContext, city: city)
                    }
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
                            .scaledToFit()
                            .frame(width: 25, height: 25, alignment: .center)
                    })
                    .accentColor(Color.white)
                    .sheet(isPresented: $showAddCityView) {
                        AddCityView(cityManager: cityManager)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        // ACTION
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25, alignment: .center)
                    })
                    .accentColor(Color.white)
                }
            }
            .animation(.easeInOut(duration: 1.5))
            .fullScreenCover(isPresented: $showWeatherDetail) {
                if let city = selectedCity {
                    WeatherDetailItemView(cityName: city, showCloseIcon: true)
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
