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
    @State var emer2 :[Numb2] = []
    @State private var isLoading = false
    
    
    
    var body: some View {
        
        VStack() {
            
            ZStack{

            NavigationStack {
                VStack{
                    if events.isEmpty {
                        VStack{
                            Text("Search for a country")
                                .font(.title.weight(.bold))
                                .foregroundColor(Color.gray)
                            Text("Start searching for a country \n to add it to your list")
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center)
                        }.position(x: 190, y: 255)
                    }
                    List{
                        ForEach(events){ cont in
                            
                            Group{
                                
                                ZStack (alignment: .leading){
                                    
                                    Image("earth")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 330, height: 90)
                                        .cornerRadius(18)
                                        .overlay( Rectangle()
                                            .foregroundColor(.black)
                                            .cornerRadius(18)
                                            .opacity(0.1))
                                    
                                    let item = emer2.filter { $0.Country == cont.contry ?? ""}
                                    
                                    
                                    
                                    ForEach(item) { emere  in
                                        
                                        
                                        
                                        emere.bannerImage2.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 330, height: 90)
                                            .cornerRadius(18)
                                            .overlay( Rectangle()
                                                .foregroundColor(.black)
                                                .cornerRadius(18)
                                                .opacity(0.1))
                                        
                                        
                                    }
                                    //                        Image(cityPic)
                                    //                            .resizable()
                                    //                            .aspectRatio(contentMode: .fill)
                                    //                            .frame(width: 330, height: 90)
                                    //                            .cornerRadius(18)
                                    //                            .overlay( Rectangle()
                                    //                                .foregroundColor(.black)
                                    //                                .cornerRadius(18)
                                    //                                .opacity(0.1))
                                    
                                    
                                    Text(cont.contry ?? "")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .bold()
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                        .padding()
                                    
                                    
                                }.padding(.horizontal,40)
                                //                                city(cityPic: "earth" , cityName: cont.contry ?? "")
                                
                                
                                
                            }.swipeActions {
                                Button(role: .destructive) {
                                    viewContext.delete(cont)
                                    do {
                                        try viewContext.save()
                                    } catch {
                                        
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }.listRowBackground(Color.clear)
                        }
                        
                        
                    }.scrollContentBackground(.hidden)
                }
                
                Spacer()
                    .navigationTitle("Countries")
                    .font(.system(size: 30))
                
                
                //                    .toolbar{
                //                        ToolbarItemGroup(placement: .navigationBarTrailing){
                //
                //                            Menu {
                //                                Section {
                //                                    Button(action: {}) {
                //                                        Label("Edit List", systemImage: "pencil")
                //                                    }
                //
                //                                    Button(action: {
                //                                        showingNatio.toggle()
                //                                    }) {
                //                                        Label("Edit Nationality", systemImage: "globe.asia.australia.fill")
                //                                    }
                //
                //                                    Button(action: {
                //                                        showingNotifi.toggle()
                //                                    }) {
                //                                        Label("Notification", systemImage: "bell.badge")
                //                                    }
                //                                }
                //
                //                            }label: {
                //                                Image(systemName: "ellipsis.circle")
                //                                    .resizable()
                //                                    .scaledToFit()
                //
                //                                    .frame(width: 22)
                //                                    .frame(maxWidth: 330,  alignment: .trailing)
                //                                    .padding(.top)
                //                            }
                //
                //                        }//ToolbarItemGroup
                //                    }//toolbar
                //.searchable(text: $searchText)
                
                
            }.searchable(text: $searchText) {
                
                
                ForEach(array) { emergency in
                    //Text(emergency.Country).searchCompletion(emergency)
                    
                    ZStack{
                        HStack{
                            Text(emergency.Country).searchCompletion(emergency)
                            Spacer()
                            
                            
                            Button {
                                
                                
                                //   let cont = SavedCountry(context: viewContext)
                                var con = emergency.Country
                                var amb = emergency.Ambulance
                                var fire = emergency.Fire
                                var pol = emergency.Police
                                locaiton = emergency.Country
                                
                                
                                
                                fetchEvent2(National: vm.nationality, loca: locaiton,Fire: Int16(fire), Ambulance: Int16(amb),police: Int16(pol))
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
                    
                    
                }
                
                // NavigationStack
                if array.isEmpty{
                    
                    
                    ZStack{
                        Color(.black).ignoresSafeArea()
                       
                        VStack{
                            
                            Spacer()
                            
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .yellow)).scaleEffect(2)
                            
                            Spacer()
                        }
                    }
                    
                }
                
            }
                
        }
            
            

            
        }.onAppear{
            fetchEvent()
            fetchImage()
            
        }
        //.sheet(isPresented: $showingNatio) {
        //   Nationality()
        //            }.sheet(isPresented: $showingNotifi) {
        //                Notification()
        //            }
        
    }//vstack
    
    
    var array : [Emergency] {
        searchText.isEmpty ? em : em.filter{$0.Country.contains(searchText)
        }
    }
    func fetchEvent(){
        
        em.removeAll()
        isLoading = true
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
        
        isLoading = false
        
    }
    
    func fetchEvent2(National: String, loca: String, Fire: Int16, Ambulance: Int16, police: Int16){
        
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
                    vis.fire = Fire
                    vis.ambulance =  Ambulance
                    vis.contry = loca
                    vis.police =  police
                    
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
    func fetchImage(){
        
        emer2.removeAll()
        
        
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType:"Emergency", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = {recordID, result in
            switch result{
            case .success(let record):
                let event = Numb2(record: record)
                emer2.append(event)
                
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









