//
//  UserScreen.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/10/22.
//

import SwiftUI

struct AddLocation: View {
    @EnvironmentObject var user: UserForm
    @Binding var locationNum: Int
    @StateObject var location = Location()
    
    var body: some View {
        
        VStack{
            Text("Add Location #\(locationNum)").font(.system(size:33))
                .bold()
            Spacer()
            HStack {
                Spacer()
                Text("Location Name:")
                    .bold()
                    .frame(width: 75)
                    .padding(.trailing, 25)
                    .padding(.leading, 75)
                TextField("Location Name", text: $user.name)
                    .frame(width: 100)
                    .padding(.trailing, 50)
                Spacer()
            }
            Spacer()
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
                    .frame(width: 100)
                    .padding(.trailing, 50)
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
        }
    }
}

struct UserScreen: View{
    @State var allFilled = false
    @StateObject var user = UserForm()
    @State var locationNum = 1
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
                            AddLocation(locationNum: $locationNum)
                        }
                        Spacer()
                        
                        Button (action: {
                            if(user.checkProperties()){
                                allFilled.toggle()
                            }

                        }){
                            if (!self.allFilled){
                                Text("Submit User")
                            }
                            
                        }
                        if allFilled{
                            Button (action: {

                            }){
                                Text("Add Location")
                                
                            }
                        }
                        Spacer()
                    
                }
                .frame(height: geometry.size.height / 2)
                    .frame(width: geometry.size.width * 5/6)
                        
                    
                }
                .navigationTitle("User Form")
            }
        }.environmentObject(user)
    }
}
