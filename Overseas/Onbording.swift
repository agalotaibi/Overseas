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
                    
                    Image("FriendsOn")
                        .resizable().aspectRatio(contentMode: .fit)
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
                    
                    Text("We Take Care Of You, Helping You To Reach Out SOS Services No Matter Where You Are")
                        .font(.system(size: 20))
                        .foregroundColor(Color("ourGray"))
                        .frame(maxWidth: 300, alignment: .leading)
                    Spacer()
                } .tag(1)
                
                
                
                VStack{
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .padding()
                    
                    
                    
                    Text("Please Select")
                        .font(.system(size: 32))
                        .foregroundColor(Color("ourGray"))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Text("Your Nationality")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkBlue"))
                        .frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    
                    
//                    Picker("Please choose a color", selection: $selectedNationality) {
//                        ForEach(nationality, id: \.self) {
//                            Text($0)
                    
                       
                PickerView()
                    
                    Button(action: {
                        //shouldShow = false
                    },
                           
                           label:{Text("Done")
                            .padding()
                            .frame(maxWidth: 180)
                            .font(.callout)
                            .foregroundColor(.white).background(Color("Prime"))
                        .cornerRadius(12)})
                    
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






