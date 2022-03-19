//
//  MapScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import MapKit
import SwiftUI

struct MapScreen: View{
    @StateObject private var viewModel = MapScreenViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .accentColor(Color(.systemPink))
                    .onAppear {
                        viewModel.checkLocationServiceEnabled()
                    }
            }
            .navigationTitle("Map")
        }
    }
}
