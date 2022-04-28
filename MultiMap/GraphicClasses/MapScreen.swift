//
//  MapScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import MapKit
import SwiftUI

struct MapScreen: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                GeometryReader { proxy in
//                    MapView()
//                        .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
//                }
//            }
//            .navigationTitle("Map")
//        }
//    }
    var body: some View {
        VStack {
          MapView()
        }
    }
}
