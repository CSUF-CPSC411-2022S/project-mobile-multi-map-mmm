//
//  RoutesScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import SwiftUI

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    var items: [Bookmark]?
}

struct RoutesScreen: View{
    let items: [Bookmark] = [.example1, .example2]

    
    var body: some View {
        NavigationView{
            ZStack{
                Color.red
                
                List(items, children: \.items) { row in
                    Text(row.name)
                    Text(": ")
                    Text(row.address)
                }
                
            }
            .navigationTitle("Optimized Route")
        }
    }
}

extension Bookmark {
    static let school = Bookmark(name: "CSUF", address: "800 N State College Blvd Fullerton, CA 92831")
    static let home = Bookmark(name: "Home", address: "4734 Darien St, Torrance, CA 90503")
    
    static let example1 = Bookmark(name: "Route 1", address: "", items: [Bookmark.school, Bookmark.home])
    static let example2 = Bookmark(name: "Route 2", address: "", items: [Bookmark.school, Bookmark.home])
}
