//
//  addCity.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI

struct addCity: View {
    
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    @State private var showingNatio = false
    @State private var showingNotifi = false
    
  
    var body: some View {
        
       VStack() {
                
                NavigationStack {
                    
                    //                List {
                    //                    ForEach(searchResults, id: \.self) { name in
                    //
                    //                            Text(name)
                    //
                    //                    }
                    //                }
                    //                .scrollContentBackground(.hidden)
                    
//
                    
                    VStack{
                        city(cityPic: "france" , cityName: "France")
                    }
                    
                    Spacer()
                    .navigationTitle("Countries")
                    .font(.system(size: 30))
                    
                    
                    .toolbar{
                        ToolbarItemGroup(placement: .navigationBarTrailing){
                            
                            Menu {
                                Section {
                                    Button(action: {}) {
                                        Label("Edit List", systemImage: "pencil")
                                    }
                                    
                                    Button(action: {
                                        showingNatio.toggle()
                                    }) {
                                        Label("Edit Nationality", systemImage: "globe.asia.australia.fill")
                                    }
                                    
                                    Button(action: {
                                        showingNotifi.toggle()
                                    }) {
                                        Label("Notification", systemImage: "bell.badge")
                                    }
                                }
                                
                            }label: {
                                Image(systemName: "ellipsis.circle")
                                    .resizable()
                                    .scaledToFit()
                                
                                    .frame(width: 22)
                                    .frame(maxWidth: 330,  alignment: .trailing)
                                    .padding(.top)
                            }
                            
                        }//ToolbarItemGroup
                    }//toolbar
                }// NavigationStack
            
                .searchable(text: $searchText) {
                    ForEach(searchResults, id: \.self) { result in
                        Text("Are you looking for \(result)?").searchCompletion(result)
                    }
                }
            
        }//vstack
        
        .sheet(isPresented: $showingNatio) {
            Nationality()
        }.sheet(isPresented: $showingNotifi) {
            Notification()
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}




    struct addCity_Previews: PreviewProvider {
        static var previews: some View {
            addCity()
        }
    }


struct city: View {

    @State var cityPic = "france"
    @State var cityName = "France"

    var body: some View {

        ZStack (alignment: .leading){

                Image(cityPic)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 360, height: 100)
                .cornerRadius(7)
                .overlay( Rectangle()
                    .foregroundColor(.black)
                    .cornerRadius(7)
                    .opacity(0.4))


                    Text(cityName)
                .foregroundColor(.white)
                .bold()
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
                .padding()


            }.padding(.horizontal,40)
        }
    }

