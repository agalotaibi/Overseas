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

    @Binding var shouldshowonb : Bool
    
   
    var body: some View {
        
        NavigationView{
            
            //  VStack {
            TabView(selection: $selectedTab){
                
                //------------- 1 onbording page ------------
                
                VStack(){
                    
                    Image("onbording1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding()
                    
                    
                    Text("Welcome to  ")
                        .font(.system(size: 48))
                        .foregroundColor(Color("darkBlue"))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Text("Overseas")
                        .font(.system(size: 48))
                        .foregroundColor(Color("Yellow"))
                        .fontWeight(.bold)
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding(.bottom)
                    
                    Text("Overseas assist you in reaching Authorities and Emergency services, everywhere")
                        .font(.system(size: 24))
                        .foregroundColor(Color("ourGray"))
                        .frame(maxWidth: 300, alignment: .leading)
                    // Spacer()
                } .tag(1)
                
                
                //------------- 2 onbording page ------------
                
                VStack (){
                    Spacer()
                    Image(systemName: "person.text.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("darkBlue"))
                        .frame(width: 250)
                        .padding()
                    
                    
                    Text("Please Select")
                        .font(.system(size: 40))
                        .foregroundColor(Color("ourGray"))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Text("Your Nationality")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Yellow"))
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding(.bottom)
                    
                    
                    PickerView()
                    
                    //.onAppear()
                    Spacer()
                    
                }.tag(2)
                
                //------------- 3 onbording page ------------
                
                VStack(){
                    
                    Image(systemName:"mappin.and.ellipse")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("darkBlue"))
                        .frame(width: 150)
                        .padding()
                    
                    Text("Please Allow ")
                        .font(.system(size: 40))
                        .foregroundColor(Color("darkBlue"))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Text("Access location")
                        .font(.system(size: 40))
                        .foregroundColor(Color("Yellow"))
                        .fontWeight(.bold)
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding(.bottom)
                    
                    Text("Allow the app to get your current locathion to provide you with the best user experince")
                        .font(.system(size: 24))
                        .foregroundColor(Color("ourGray"))
                        .frame(maxWidth: 300, alignment: .leading)
                    
//                    Spacer()
                        
                    
                    VStack{
                        
                        Button(action: {
                            
                        },label:{
                            
                           Text("Allow location")
                                
                                .foregroundColor(Color("darkBlue"))
                                .frame(width: 200, height: 50.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Yellow")/*@END_MENU_TOKEN@*/)
                                .cornerRadius(12)
                        })
                        
                        .padding()
                    
                    Button(action: {
                    
                        shouldshowonb.toggle()
                    },label:{
                        
                        Image(systemName: "arrow.forward.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("Yellow"))
                            .frame(width: 50)
                        
                    })
 
                }
                  
                    .padding()
                    
                } .tag(3)
                
                
                
            }//tab
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
        Onbording(shouldshowonb: .constant(true))
    }
}






