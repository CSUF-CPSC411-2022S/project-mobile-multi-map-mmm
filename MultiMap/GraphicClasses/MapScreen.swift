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
    @State private var directions: [String] = []
    @State private var showDirections = false
    var body: some View {
            VStack {
                MapView(directions: $directions)
                
                Button(action: {
                    self.showDirections.toggle()
                }, label: {
                    Text("Show Directions")
                })
                    .disabled(directions.isEmpty)
                    .padding()
            }.sheet(isPresented: $showDirections, content: {
                VStack(spacing: 0) {
                    Text("Directions")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Divider().background(Color(UIColor.systemBlue))
                    
                    List(0..<self.directions.count, id: \.self) {
                        i in Text(self.directions[i]).padding()
                    }
                }
            })
    }
}
