//
//  ContentView.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/8/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject var user = UserForm()
    var body: some View {
        TabView{
            UserScreen()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            MapScreen()
                .tabItem{
                    Image(systemName: "map")
                    Text("Map")
                }
            OptimizeScreen()
                .tabItem{
                    Image(systemName: "clock.arrow.circlepath")
                    Text("Optimize")
                }
            RoutesScreen()
                .tabItem{
                    Image(systemName: "mappin.circle")
                    Text("Routes")
                }
        }.environmentObject(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
