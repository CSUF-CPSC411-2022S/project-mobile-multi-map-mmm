//
//  UserScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import SwiftUI


struct UserScreen: View{
    @State var name: String = ""
    @State var age: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zip: String = ""
    @State var showingDetail = false
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ZStack{
                    Color.mint
                    VStack {
                        Spacer()
                        
                        VStack{
                            HStack {
                                Spacer()
                                Text("Name:")
                                    .bold()
                                    .frame(width: 75)
                                    .padding(.trailing, 25)
                                    .padding(.leading, 75)
                                TextField("Name", text: $name)
                                    .frame(width: 100)
                                    .padding(.trailing, 50)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("Age:")
                                    .bold()
                                    .frame(width: 75)
                                    .padding(.trailing, 25)
                                    .padding(.leading, 75)
                                TextField("Age", text: $age)
                                    .frame(width: 100)
                                    .padding(.trailing, 50)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("Street Address:")
                                    .bold()
                                    .frame(width: 145)
                                    .padding(.leading, 30)
                                TextField("Address", text: $address)
                                    .frame(width: 100)
                                    .padding(.trailing, 50)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("City:")
                                    .bold()
                                    .frame(width: 75)
                                    .padding(.trailing, 25)
                                    .padding(.leading, 75)
                                TextField("City", text: $city)
                                    .frame(width: 100)
                                    .padding(.trailing, 50)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("State:")
                                    .bold()
                                    .frame(width: 75)
                                    .padding(.trailing, 25)
                                    .padding(.leading, 75)
                                TextField("State", text: $state)
                                    .frame(width: 100)
                                    .padding(.trailing, 50)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("Zip:")
                                    .bold()
                                    .frame(width: 75)
                                    .padding(.trailing, 25)
                                    .padding(.leading, 75)
                                TextField("Zip", text: $zip)
                                    .frame(width: 100)
                                    .padding(.trailing, 50)
                                Spacer()
                            }
                            Spacer()
                            
                        }
                        Spacer()
                        Button (action: {
                            if(name != "" && age != "" &&
                               address != "" && city != ""
                               && state != "" && zip != ""){
                                showingDetail.toggle()
                            }

                        }){
                            Text("Submit")
                        }
                        
                        Spacer()
                        
                        if (showingDetail){
                            Text("Hello \(name), You are \(age) years old and live on \(address) \(city), \(state), \(zip)")
                        }
                        
                        Spacer()
                        
                    }.frame(height: geometry.size.height / 2)
                        .frame(width: geometry.size.width * 5/6)
                    
                }
                .navigationTitle("User Form")
            }
        }
    }
}
