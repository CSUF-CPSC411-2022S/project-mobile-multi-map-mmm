//
//  RoutesScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import SwiftUI

//struct Bookmark: Identifiable {
//    let id = UUID()
//    let name: String
//    let address: String
//    var items: [Bookmark]?
//}

struct RouteView: View{
    @EnvironmentObject var user: UserForm
    @Binding var routes: [[Location]]
    
    
    var body: some View {
        Spacer()
        List {
            Text("Your starting home address: ")
            if(user.fullAddress != " , ,  ") {
                Text("\(user.fullAddress)")
            }
            else {
                Text("")
            }
            if(routes.count > 0){
                ForEach(0..<routes.count, id: \.self){
                    index in
                    Section(header: Text("Route #\(index + 1)")){
                        ForEach(routes[index]){
                            loc in
                            NavigationLink(destination: Text("\(loc.fullAddress)")) {
                                Text("\(loc.name)")
                            }
                        }
                    }
                }
            }
            else {
                Text("There are no saved routes currently.")
            }
        }
        
        
        
    }
}

struct RoutesScreen: View{
    @EnvironmentObject var user: UserForm
//    let items: [Bookmark] = [.example1, .example2]
    
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }

    
    var body: some View {
        
        
        NavigationView{
            VStack{
                Spacer()
                ZStack{
                    Color.red
                    RouteView(routes: $user.routes)
                }


                
            }
            .navigationTitle("Saved Routes")

        }.environmentObject(user)
    }
}

//extension Bookmark {
//    static let school = Bookmark(name: "CSUF", address: "800 N State College Blvd Fullerton, CA 92831")
//    static let home = Bookmark(name: "Home", address: "4734 Darien St, Torrance, CA 90503")
//
//    static let example1 = Bookmark(name: "Route 1", address: "", items: [Bookmark.school, Bookmark.home])
//    static let example2 = Bookmark(name: "Route 2", address: "", items: [Bookmark.school, Bookmark.home])
//}
