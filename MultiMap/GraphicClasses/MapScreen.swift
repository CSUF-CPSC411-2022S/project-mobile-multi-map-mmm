//
//  MapScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import MapKit
import SwiftUI
import CoreLocation



//struct MapScreen: View{
//    @EnvironmentObject var user: UserForm
//
//    @StateObject private var viewModel = MapScreenViewModel()
//
//
//    var body: some View {
//        NavigationView{
//
//            ZStack{
//
//                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
//                    .accentColor(Color(.systemPink))
//                    .onAppear {
//                        if let validStart = user.coordinate {
//                            print("Inside On appear")
//                            viewModel.updateRegion(startLocation: validStart)
//                        }
//                        else{
//                            print("not valid location")
//                        }
//                        viewModel.checkLocationServiceEnabled()
//                    }
//            }
//            .navigationTitle("Map")
//        }
//
//    }
//
//}

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
