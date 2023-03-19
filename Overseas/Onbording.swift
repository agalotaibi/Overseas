//
//  Onbording.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI
import CloudKit
import CoreData
import CoreLocationUI
import CoreLocation


struct Onbording: View {
    @EnvironmentObject var vm : ViewModel
    @State private var selectedTab = 1
    @StateObject var locationManager = LocationManager()
    @State private var Cityname = ""
    @State private var Countryname = ""
    var nationality = ["Saudi Arabia"]
    @State private var selectedNationality = "Saudi Arabia"
    @Binding var shouldshowonb : Bool
    
   
    var body: some View {
        
        NavigationView{
            
            //  VStack {
            TabView(selection: $selectedTab){
                
                //------------ 1 onbording page ------------
                
                VStack(){
                    
                    Image("onB1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding()
                    
                    
                    Text("Welcome to  ")
                        .font(.system(size: 48))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Text("Overseas")
                        .font(.system(size: 48))
                        .fontWeight(.bold)
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding(.bottom).foregroundColor(Color("yellow"))
                    
                    Text("Overseas assist you in reaching authorities and emergency services, everywhere")
                        .font(.system(size: 24))
                        .frame(maxWidth: 300, alignment: .leading)
                    // Spacer()
                } .tag(1)
                
                
                //------------- 2 onbording page ------------
                
                VStack (){
                   Spacer()
                    Image(systemName: "person.text.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("yellow"))
                        .frame(width: 200)
                        .padding()
                    
                   // Spacer()
                    
                    Text("Please Select")
                        .font(.system(size: 40))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Text("Your Nationality")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .frame(maxWidth: 300, alignment: .leading)
                       // .padding(.bottom)
                    
                    //Spacer()
                    VStack {
                    
                        Picker("Please choose a color", selection: $vm.nationality) {
                            ForEach(nationality, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(WheelPickerStyle())
                       
                        .frame(width: 200, height: 150)
                        
                        //this is the old yellow button for you selected .
//                        Text("You selected: \(vm.nationality)").bold().padding()
//                        .background(Color("yellow")).cornerRadius(40)
                       
                        
                        /*-------------
                         the correct You selected line
                         ------------*/
                        
//                        HStack{
//                            Text("You selected:").bold()
//                            Text(" \(vm.nationality)")
//                        }
                        
                        Button(action: {
                            
                        shouldshowonb.toggle()
                        
                        
                           
                        },label:{
                            
                            Image(systemName: "arrow.forward.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("yellow"))
                                .frame(width: 50)
                               // .padding(.top)
                            
                        }).padding()
                         
                       
                    }
                  
                    Spacer()
                    
                }.tag(2)
                
                //------------- 3 onbording page ------------
                
               
                
                
                
            }
            .tabViewStyle(PageTabViewStyle()).indexViewStyle(.page(backgroundDisplayMode: .always))
            .onAppear{
                print(vm.nationality,"😀")
            }
            
        }
    }
    
    
}

func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
        completion(placemarks?.first?.locality,
                   placemarks?.first?.country,
                   error)
    }
}

struct Onbording_Previews: PreviewProvider {
    static var previews: some View {
        Onbording(shouldshowonb: .constant(true)).environmentObject(ViewModel()).colorScheme(.dark)        // , shouldshowonb: .constant(true)
    }
}






