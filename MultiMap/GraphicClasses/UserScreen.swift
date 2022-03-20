//
//  UserScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import SwiftUI

struct AddLocation: View {
    @EnvironmentObject var user: UserForm
    @State var locationNum: Int = 1;
    @State var name: String = ""
    @State var streetNum: String = ""
    @State var streetName: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zip: String = ""
    var filledForm :  Bool {
        return name != "" &&
            streetNum != "" && streetName != ""
             && city != "" && state != "" && zip != ""
    }
    var body: some View {
        
        VStack{
            Text("Add Location").font(.system(size:33))
                .bold()
            Spacer()
            HStack {
                Spacer()
                Text("Location Name:")
                    .bold()
                    .frame(width: 125)
                    .padding(.trailing, 5)
                    .padding(.leading, 45)
                TextField("Location Name", text: $name)
                    .frame(width: 130)
                    .padding(.trailing, 20)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Street Number:")
                    .bold()
                    .frame(width: 125)
                    .padding(.trailing, 5)
                    .padding(.leading, 45)
                TextField("Street Number", text: $streetNum)
                    .frame(width: 130)
                    .padding(.trailing, 20)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Street Name:")
                    .bold()
                    .frame(width: 125)
                    .padding(.trailing, 5)
                    .padding(.leading, 45)
                TextField("Street Name", text: $streetName)
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
            Button (action: {
                if(filledForm){
                    let location = Location(locationNum, name, streetNum, streetName, city, state, zip)
                    user.locationStops.append(location)
                    name = ""
                    streetNum = ""
                    streetName = ""
                    city = ""
                    state = ""
                    zip = ""
                    locationNum += 1
//                    print("***********************Current Location:\n\(location.fullAddress)\n")
//                    user.printLocations()
                }
            }){
                Text("Add Location")
                
            }

        }
    }
}

struct InitialUserForm: View {
    @EnvironmentObject var user: UserForm
    var body: some View {
        VStack{
            Text("User Information").font(.system(size: 33))
                .bold()
            HStack {
                Spacer()
                Text("Name:")
                    .bold()
                    .frame(width: 75)
                    .padding(.trailing, 25)
                    .padding(.leading, 75)
                TextField("Name", text: $user.name)
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
                TextField("Age", text: $user.age)
                    .frame(width: 100)
                    .padding(.trailing, 50)
                Spacer()
            }
            HStack {
                Spacer()
                Text("House Number:")
                    .bold()
                    .frame(width: 125)
                    .padding(.trailing, 5)
                    .padding(.leading, 45)
                TextField("House Number", text: $user.streetNum)
                    .frame(width: 130)
                    .padding(.trailing, 20)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Street Name:")
                    .bold()
                    .frame(width: 125)
                    .padding(.trailing, 5)
                    .padding(.leading, 45)
                TextField("Street Name", text: $user.streetName)
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
                TextField("City", text: $user.city)
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
                TextField("State", text: $user.state)
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
                TextField("Zip", text: $user.zip)
                    .frame(width: 100)
                    .padding(.trailing, 50)
                Spacer()
            }
            Spacer()
                    }
    }
}

struct UserScreen: View{
    @State var allFilled = false
    @EnvironmentObject var user: UserForm
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ZStack{
                    Color.mint
                    VStack {
                        Spacer()
                        if (!self.$allFilled.wrappedValue){
                            InitialUserForm()
                        }
                        else{
                            AddLocation()
                        }
                        Spacer()
                        
                        Button (action: {
                            if(user.checkProperties()){
                                allFilled.toggle()
//                                user.printLocations()
                            }

                        }){
                            if (!self.allFilled){
                                Text("Submit User")
                            }
                            
                        }
                        
                        Spacer()
                    
                }
                .frame(height: geometry.size.height / 2)
                    .frame(width: geometry.size.width * 5/6)
                        
                    
                }
                .navigationTitle("User Form")
            }
        }
    }
}
