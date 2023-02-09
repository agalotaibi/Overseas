//
//  ContentView.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI
import CoreLocationUI
import CoreLocation

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}

struct ContentView: View {
    @State private var selectedTab = 1
    @StateObject var locationManager = LocationManager()
    @State private var Cityname = ""
    @State private var Countryname = ""
    
    //@Binding  var shouldShow :Bool
    var body: some View {
        NavigationView{
            
            //  VStack {
            TabView(selection: $selectedTab){
                
                VStack(){
                    
                    Image("FriendsOn").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 250).padding().padding(.top)
                    
                    Text("Welcome to  ")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                    Text("Overseas")
                        .font(.system(size: 46))
                        .fontWeight(.bold).frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    
                    Text("......")
                        .font(.system(size: 20))
                        .frame(maxWidth: 300, alignment: .leading)
                    Spacer()
                } .tag(1)
                
                
                
                VStack{
                    Image("").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 300).padding()
                    
                    Spacer()
                    
                    Text("Please Select")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                    Text("Your Nationality")
                        .font(.system(size: 46))
                        .fontWeight(.bold).frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    
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
                                //print(city + ", " + country)
                            }
                        } else {
                            print("INVALED!!!!!!!")
                        }
                        //------------------------------
                    }
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .foregroundColor(.white)
                    
                    Text("...... ")
                        .font(.system(size: 20))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Spacer()
                    
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

//------------------------------------------
func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
        completion(placemarks?.first?.locality,
                   placemarks?.first?.country,
                   error)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
