//
//  Onbording.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI

struct Onbording: View {
    @State private var selectedTab = 1
    
    var nationality = ["Saudi Arabia", "USA", "UK", "Bahrin"]
    @State private var selectedNationality = "UK"

    //@Binding  var shouldShow :Bool
    var body: some View {
        NavigationView{
            
            //  VStack {
            TabView(selection: $selectedTab){
                
                VStack(){
                    
                    Image("onbording1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.top)
                    
                    Text("Welcome to  ")
                        .font(.system(size: 46))
                        .foregroundColor(Color("darkBlue"))
                        .frame(maxWidth: 300, alignment: .leading)
                   
                    Text("Overseas")
                        .font(.system(size: 46))
                        .foregroundColor(Color("Yellow"))
                        .fontWeight(.bold)
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding(.bottom)
                    
                    Text("Overseas assist you in reaching Authorities and Emergency services, everywhere")
                        .font(.system(size: 20))
                        .foregroundColor(Color("ourGray"))
                        .frame(maxWidth: 300, alignment: .leading)
                   // Spacer()
                } .tag(1)
                
                
                
                VStack (){
                    Spacer()
                   Image(systemName: "person.text.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("darkBlue"))
                        .frame(width: 200)
                        .padding()
                        
                    
                    Text("Please Select")
                        .font(.system(size: 32))
                        .foregroundColor(Color("ourGray"))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Text("Your Nationality")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkBlue"))
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding(.bottom)
                    
                       
                PickerView()
                    
                    
                    Button(action: {
                        //shouldShow = false
                    },label:{
                    
                        Image(systemName: "arrowshape.turn.up.right.fill")
                            .foregroundColor(Color("Yellow"))
                            .padding()
                            .frame(maxWidth: 180)
                            .font(.callout)
                            .background(Color("Prime"))
                        .cornerRadius(12)})
                    //.onAppear()
                   Spacer()
                    
                }.tag(2)
                
            }
            .frame(width: .infinity, height: .infinity)
            .tabViewStyle(PageTabViewStyle()).indexViewStyle(.page(backgroundDisplayMode: .always))
            
        }
    }
    
    
}


struct PickerView: View {
    var nationality = ["Saudi Arabia", "USA", "UK", "Bahrin"]
    @State private var selectedNationality = ""

    var body: some View {
        VStack {
            Text("You selected: \(selectedNationality)")
            Picker("Please choose a color", selection: $selectedNationality) {
                ForEach(nationality, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(WheelPickerStyle())
            
        }
    }
}











struct Onbording_Previews: PreviewProvider {
    static var previews: some View {
        Onbording()
    }
}






