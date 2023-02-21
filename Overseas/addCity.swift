//
//  addCity.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI
import CloudKit

struct addCity: View {
    
    @State private var searchText = ""
    @State private var showingNatio = false
    @State private var showingNotifi = false
    @State var em :[Emergency] = []
    @State private var contry = ""
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    @State private var shoeingAddscreen = false
    @FetchRequest(sortDescriptors: [])
    private var events: FetchedResults<SavedCountry>
    
    
    var body: some View {
        
        VStack() {
            
            NavigationStack {
                
                //                List{
                //                    ForEach(array) { emergency in
                //
                //                        HStack{
                //                            Text(emergency.Country)
                //                            Spacer()
                //                            Button {
                //
                //                            } label: {
                //                                Text("Add")
                //                                    .foregroundColor(Color.blue)
                //                            }
                //
                //                        }
                //
                //
                //                    }
                //                }.onAppear{
                //                    fetchEvent()
                //
                //                }
                //                .scrollContentBackground(.hidden)
                
                
                
                VStack{
                    List{
                        ForEach(events){ cont in
                            
                       
                            
                            city(cityPic: "france" , cityName: cont.contry ?? "")}
                        
                    }.scrollContentBackground(.hidden)
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
                //.searchable(text: $searchText)
            }.searchable(text: $searchText) {
                ForEach(array) { emergency in
                    //Text(emergency.Country).searchCompletion(emergency)
                    HStack{
                        Text(emergency.Country).searchCompletion(emergency)
                        Spacer()
                        Button {
//                            var slected = emergency.Country
//                            let cont = CountriesList(context: moc)
//                            cont.country = emergency.Country
//
//                            try? moc.save()
                            
                            let cont = SavedCountry(context: viewContext)
                            cont.contry = emergency.Country
                            
                            do {
                                try viewContext.save()
                                
                            } catch {
                                presentationMode.wrappedValue.dismiss()
                                
                            }
                            
                        } label: {
                            Text("Add")
                                .foregroundColor(Color.blue)
                        }
                        
                    }
                    .padding(.horizontal).frame(maxWidth: 390)
                }
                // NavigationStack
                
                
            }.onAppear{
                fetchEvent()
                
            }
            }.sheet(isPresented: $showingNatio) {
                Nationality()
            }.sheet(isPresented: $showingNotifi) {
                Notification()
            }
            
        }//vstack
        
        
    var array : [Emergency]{
        searchText.isEmpty ? em : em.filter{$0.Country.contains(searchText)
        }
    }
    func fetchEvent(){
        em.removeAll()
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType:"Emergency", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = {recordID, result in
            switch result{
            case .success(let record):
                let emer = Emergency(record: record)
                em.append(emer)
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
        
    }
    
    func fetchSpecific(){
        em.removeAll()
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType:"Emergency", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = {recordID, result in
            switch result{
            case .success(let record):
                let emer = Emergency(record: record)
                em.append(emer)
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
        
    }
    }
    
//    var searchResults: [String] {
//        if searchText.isEmpty {
//            return names
//        } else {
//            return names.filter { $0.contains(searchText) }
//        }
//
//
//    }
    

    
    //    func fetchCount(){
    //
    //        let serCount = country(context: viewContext)
    //        newcountry
    //
    //    }






    struct addCity_Previews: PreviewProvider {
        static var previews: some View {
            addCity().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }


struct city: View {

    @State var cityPic = "france"
    @State var cityName = ""
    @State private var country = ""
    @State var em :[Emergency] = []
    //@FetchRequest(sortDescriptors: []) var countries: FetchedResults <CountryList>
    @Environment(\.managedObjectContext) var moc


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


struct Emergency: Identifiable{
    let record: CKRecord
    let Country: String
    let id: CKRecord.ID
    
    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.Country = record["Country"] as? String ?? ""
       
    }

    
    
}

