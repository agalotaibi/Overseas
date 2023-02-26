//
//  addCity.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI
import CloudKit

struct addCity: View {
    
    @EnvironmentObject var vm : ViewModel
    
    @State private var searchText = ""
    @State private var locaiton = ""
    @State private var showingNatio = false
    @State private var showingNotifi = false
    @State var em :[Emergency] = []
    @State var embb :[Emb] = []
    @State private var contry = ""
    @State private var ambulance = ""
    @State private var fire = ""
    @State private var police = ""
    @State private var embassy = ""
    @State private var nation = ""
    @State private var qunsl = ""
    @State private var vistedcont = ""
    @State var imageName = ""
    @State var embas2 = ""
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    @State private var shoeingAddscreen = false
    @FetchRequest(sortDescriptors: [])
    private var events: FetchedResults<SavedCountry>
    @State var emb :[Emb] = []

    
    
    var body: some View {
        
        VStack() {
            
            NavigationStack {
                VStack{
                    List{
                        ForEach(events){ cont in
                            
                            Group{
                                
                                city(cityPic: "earth" , cityName: cont.contry ?? "")}.swipeActions {
                                    Button(role: .destructive) {
                                        viewContext.delete(cont)
                                        do {
                                            try viewContext.save()
                                        } catch {
                                            
                                        }
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                        }

                        
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

                            
                         //   let cont = SavedCountry(context: viewContext)
                          var con = emergency.Country
                            var amb = String(emergency.Ambulance)
                            var fire = String(emergency.Fire)
                            var pol = String(emergency.Police)
                            locaiton = emergency.Country
                           
                            
                            
                           fetchEvent2(National: vm.nationality, loca: locaiton,Fire: fire, Ambulance: amb,police: pol)
//                            for embss in emb{
//
//                                let vis = SavedCountry(context: viewContext)
//                                vis.embassy = embss.Embasy_n
//                                vis.qunsl = embss.Consulate_no
//
//                            }
                            
                               
                          
                            //fetchSpecific()
                                
                            
                            
                            
                            
                            
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
        
        
    var array : [Emergency] {
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
    
    func fetchEvent2(National: String, loca: String,Fire: String, Ambulance: String,police: String){
       
        //
        embb.removeAll()
       // print("🦋🦋🦋🦋-------------",National)
       // print("⛑⛑⛑",National)
        
        let predicate = NSPredicate(
            format: "Nationality == %@ && Country == %@",
            National,loca)

        let query = CKQuery(recordType:"Country", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = {recordID, result in
          //  print("🌈",loca)
            switch result{
            case .success(let record):
                let event = Emb(record: record)
                embb.append(event)
                print("🐙",loca)
                for embss in embb{
                    let vis = SavedCountry(context: viewContext)
                            vis.embassy = embss.Embasy_n
                            vis.qunsl = embss.Consulate_no
                    vis.fire = Int16(Fire) ?? 0
                    vis.ambulance =  Int16(Ambulance) ?? 0
                    vis.contry = loca
                    vis.police =  Int16(police) ?? 0
                
                                          }
                
                do {
                    try viewContext.save()
                    print("🐊🐊")
                    
                } catch {
                    presentationMode.wrappedValue.dismiss()
                    
                }

            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }

        CKContainer.default().publicCloudDatabase.add(operation)
        
    

    }
    }
    





    struct addCity_Previews: PreviewProvider {
        static var previews: some View {
            addCity().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }


struct city: View {

    @State var cityPic = "earth"
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
    let Ambulance: Int
    let Fire: Int
    let Police: Int
    let Image2: CKAsset?

    let id: CKRecord.ID
    
    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.Country = record["Country"] as? String ?? ""
        self.Ambulance = record["Ambulance"] as? Int ?? 0
        self.Fire = record["Fire"] as? Int ?? 0
        self.Police = record["Police"] as? Int ?? 0
        self.Image2 = record["Image"] as? CKAsset
       
    }
    

    
    
}




