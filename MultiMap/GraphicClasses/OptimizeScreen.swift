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
                    // for each navigation in list
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
                                NavigationLink(destination: Text("\(loc.fullAddress)")) {
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
}

