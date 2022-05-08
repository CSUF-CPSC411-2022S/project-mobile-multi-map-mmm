//
//  MapScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import MapKit
import SwiftUI
import CoreLocation

struct MapScreen: View {
    var body: some View {
            VStack {
                MapView()
                
                Button(action: {
                    
                }, label: {
                    Text("Show Directions")
                })
                    .padding()
            }
    }
}
