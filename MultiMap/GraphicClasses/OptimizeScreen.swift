//
//  OptimizeScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import SwiftUI

struct OptimizeScreen: View {
    @EnvironmentObject var user: UserForm
    @StateObject var finder = LocationDetails()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.orange
                VStack {
                    Spacer()
                    //Text(locationStops[0])
                    List {
                        Text("Your starting home address: ")
                        if(user.fullAddress != " , ,  ") {
                            Text("\(user.fullAddress)")
                        }
                        else {
                            Text("")
                        }
                        Section(header: Text("Current Route:")) {
                            ForEach(user.locationStops){
                                loc in
                                NavigationLink(destination: thirdScreenA) {
                                    Text("\(loc.name)")
                                    
                                }
                            }
                           
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Optimized Route")
        }
    }
    
    var thirdScreenA: some View {
        VStack {
            Text("670 Spectrum Center")
            Button(action: {
                print("CURRENT COORDINATE: \(user.coordinateArray)")
                finder.findCoordString(user.coordinateArray);
                finder.find()
                print("DISTANCE: \(finder.getDistance())")
                print("NEW COORDINATES: \(finder.newCoords)")
            }) {
                Text("Find crosswalk")
            }
        }
        
      }
}

