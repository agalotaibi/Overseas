//
//  location.swift
//  Overseas
//
//  Created by Amaal on 27/08/1444 AH.
//

import SwiftUI
import CloudKit
import CoreData
import CoreLocationUI
import CoreLocation

struct location: View {
    @EnvironmentObject var vm : ViewModel
    @State private var selectedTab = 1
    @StateObject var locationManager = LocationManager()
    @State private var Cityname = ""
    @State private var Countryname = ""
    var nationality = ["Saudi Arabia"]
    @State private var selectedNationality = "Saudi Arabia"
    var body: some View {
        VStack{
            
            Image(systemName:"mappin.and.ellipse")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("darkBlue"))
                .frame(width: 150)
                .padding().padding(.bottom)
            
            Text("No Location")
                .font(.system(size: 40))
                .frame(maxWidth: 300, alignment: .leading)
                .fontWeight(.bold)
            Text("Tracking")
                .font(.system(size: 40))
                .frame(maxWidth: 300, alignment: .leading)
                .padding(.bottom)
            
            
//                    Text("Overseas will not track you, it will take your region from your device.")
//                        .font(.system(size: 24))
//                        .foregroundColor(Color("ourGray"))
//                        .frame(maxWidth: 300, alignment: .leading)
//                    Text("Please Allow ")
//                        .font(.system(size: 40))
//                        .frame(maxWidth: 300, alignment: .leading)
//
//                    Text("Access Location")
//                        .font(.system(size: 40))
//                        .fontWeight(.bold)
//                        .frame(maxWidth: 300, alignment: .leading)
//                        .padding(.bottom)
//
//                    Text("Allow the app to get your current locathion to provide you with the best user experince")
//                        .font(.system(size: 24))
//                        .foregroundColor(Color("ourGray"))
//                        .frame(maxWidth: 300, alignment: .leading)
            
//                    Spacer()
                
            
            VStack{
                
                                    //------------------------------
                                   LocationButton(.shareCurrentLocation){
                                        locationManager.requestLocation()
                                        if let location = locationManager.location {
                                            print("longitude: ",location.longitude)
                                            print("latitude: ",location.latitude)
                                            //------------------------------
                                            let location = CLLocation(latitude:location.latitude, longitude: location.longitude)
                                            location.fetchCityAndCountry { city, country, error in
                                                guard let city = city, let country = country, error == nil else { return }
                                                Cityname = city
                                                Countryname = country
                                             print(Cityname)
                                            }
                                        } else {
                                            print("INVALED!!!!!!!")
                                        }
                                    }//------------------------------
                                    .cornerRadius(30)
                                   .tint(Color("Yellow"))
                                   .foregroundColor(Color("darkBlue"))
                                  
                
                                  //  .padding()
            
           

        }
          
           .padding()
            
        } .tag(3)
    }
}

struct location_Previews: PreviewProvider {
    static var previews: some View {
        location()
    }
}
