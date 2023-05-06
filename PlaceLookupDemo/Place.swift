//
//  Place.swift
//  PlaceLookupDemo
//
//  Created by Eric on 06/05/2023.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID().uuidString
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var name: String {
        self.mapItem.name ?? ""
    }
    
    var address: String {
        let placemark = self.mapItem.placemark
        var cityAndState = ""
        var address = ""
        
        cityAndState = placemark.locality ?? "" // City
        if let state = placemark.administrativeArea {
            // Show either state or city, state
            cityAndState = cityAndState.isEmpty ? state : "\(cityAndState), \(state)"
        }
        address = placemark.subThoroughfare ?? "" // address #
        if let street = placemark.thoroughfare {
            // Just show the street unless there is a street # the add space + street
            address = address.isEmpty ? street : "\(address) \(street)"
        }
        if address.trimmingCharacters(in: .whitespaces).isEmpty && !cityAndState.isEmpty {
            // No address? Then just cityAndState with no space
            address = cityAndState
        } else {
            // No cityAndState? Then just address, otherwise addressm cityAndState
            address = cityAndState.isEmpty ? address : "\(address), \(cityAndState)"
        }
        
        return address
    }
}
