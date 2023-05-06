//
//  PlaceLookupDemoApp.swift
//  PlaceLookupDemo
//
//  Created by Eric on 06/05/2023.
//

import SwiftUI

@main
struct PlaceLookupDemoApp: App {
    @StateObject var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
