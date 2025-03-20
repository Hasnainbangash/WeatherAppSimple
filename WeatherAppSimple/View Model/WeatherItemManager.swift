//
//  WeatherItemManager.swift
//  WeatherAppSimple
//
//  Created by Elexoft on 20/03/2025.
//

import SwiftUI

class WeatherItemManager: ObservableObject {
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: Date())
    }
    
}
