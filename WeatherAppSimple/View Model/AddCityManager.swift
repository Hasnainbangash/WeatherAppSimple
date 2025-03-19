//
//  AddCityManager.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 19/03/2025.
//

import SwiftUI
import CoreData

class AddCityManager: ObservableObject {
    @Published var cityData: [CityDetails] = []

    // Function to add a new city to Core Data
    func addCity(context: NSManagedObjectContext, name: String) {
        let newCity = CityDetails(context: context)
        newCity.name = name

        do {
            try context.save()
            print("City saved successfully: \(name)")
        } catch {
            print("Failed to save city: \(error.localizedDescription)")
        }
    }
}
