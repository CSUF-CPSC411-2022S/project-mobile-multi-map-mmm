//
//  OptimizeScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import SwiftUI

struct OptimizeScreen: View {
    @EnvironmentObject var user: UserForm
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.orange
                VStack {
                    Spacer()
                    //Text(locationStops[0])
                    List {
                        Text("Your starting home address: ")
                        Text("\(user.fullAddress)")
                        Section(header: Text("Current Route:")) {
                            NavigationLink(destination: Text("First Location Details")) {
                                Text("First Location")
                            }
                            NavigationLink(destination: Text("Second Location Details")) {
                                Text("Second Location")
                            }
                            NavigationLink(destination: Text("Third Location Details")) {
                                Text("Third Location")
                            }
                            NavigationLink(destination: Text("Fourth Location Details")) {
                                Text("Fourth Location")
                            }
                            NavigationLink(destination: Text("Fifth Location Details")) {
                                Text("Fifth Location")
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Optimized Route")
        }
    }
}

