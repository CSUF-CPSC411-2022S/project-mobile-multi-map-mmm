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
                finder.find("670 Spectrum Center Irvine, CA 92618")
            }) {
                Text("Find crosswalk")
            }
        }
        
      }
}

