//
//  PlaceLookupView.swift
//  PlaceLookupDemo
//
//  Created by Eric on 06/05/2023.
//

import SwiftUI

struct PlaceLookupView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    var places = ["Here", "There", "Everywhere", "East Jabib"]
    
    var body: some View {
        NavigationStack {
            List(places, id: \.self) { place in
                Text(place)
                    .font(.title2)
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct PlaceLookupView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceLookupView()
    }
}
