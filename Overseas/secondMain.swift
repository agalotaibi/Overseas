//
//  secondMain.swift
//  Overseas
//
//  Created by Amaal on 13/08/1444 AH.
//

import SwiftUI
import CloudKit
import CoreData

struct secondMain: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var events: FetchedResults<SavedCountry>
    @State var emer2 :[Numb2] = []
    @EnvironmentObject var vm : ViewModel
    @State var National = ""
    @State var emer :[Numb] = []
    @State var emb :[Emb] = []
    @State private var embassy = ""
    @State private var nation = ""
    @State private var qunsl = ""
    @State private var vistedcont = ""
    
    var body: some View {
        VStack{
            NavigationView {
                ForEach(events){ cont in
                    ZStack (alignment: .leading){
                        let item = emer2.filter { $0.Country == cont.contry ?? ""}
                        ForEach(item) { emere  in
                            
                            emere.bannerImage2.resizable().scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity).padding(.top, -50).overlay( Rectangle().fill(
                                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.6), .black.opacity(0.2),
                                                                               .black.opacity(0.2),
                                                                               .black.opacity(0.1),.black.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
                                )).ignoresSafeArea(.all)
                            
                        }
                        
                        VStack{
                            NavigationLink(destination: addCity(),
                                           label: {
                                Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35).frame(maxWidth: 330, maxHeight: 270,  alignment: .trailing).foregroundColor(Color.white)
                            })
                            
                            
                            Text(cont.contry ?? "")
                                .multilineTextAlignment(.center).padding(.top, -100.0).foregroundColor(Color.white)
                                .bold()
                                .font(.custom("", fixedSize: 50))
                                .listRowBackground(Color.white)
                            
                            
                            
                            
                            List{
                                
                                Section(header: Text("\(cont.contry ?? "") Emergency Numbers")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)){
                                      
                                        
                                        
                                        EmergancyOffline(Unified: Int64(cont.police), ploices: Int64(cont.police), emblances: Int64(cont.ambulance), firS: Int64(cont.fire))
                                        //--------------------------------------- First list style
                                    }.listRowBackground(Color.white)
                                
                                
                                
                                
                                
                                
                                Section(header: Text("\(vm.nationality) Foreign Affairs").font(.body).fontWeight(.bold).foregroundColor(Color.white)){
                                    
                                    affairsOffline(embassC: cont.embassy ?? "", affairsC: cont.qunsl ?? "")
                                    
                                    
                                        .listRowBackground(Color.white)
                                }

                                
                            }
                            .scrollContentBackground(.hidden)
                            .opacity(0.7)
                            .foregroundColor(Color.black)
                            .font(.system(size: 19))
                            
                            
                            
                        }.padding(.top, -50.0)
                    }
                    
                    
                    
                }
            }
        }.onAppear(){
            fetchEvent()
            fetchEvent2(National: vm.nationality)
            fetchImage()
        }
    }
    
    func country() -> String{
        
        let countryLocale : NSLocale =  NSLocale.current as NSLocale
        let countryCode  = countryLocale.object(forKey: NSLocale.Key.countryCode)// as! String
        let country = countryLocale.displayName(forKey: NSLocale.Key.countryCode, value: countryCode!)
        
        return String(country ?? "")
        
    }
    
    func fetchEvent(){
        
        emer.removeAll()
        
        let loca = country()
        
        let predicate = NSPredicate(
            format: "Country == %@",
            loca)
        
        let query = CKQuery(recordType:"Emergency", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = {recordID, result in
            switch result{
            case .success(let record):
                let event = Numb(record: record)
                emer.append(event)
                
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
                //                let newItems = emer2.filter { $0.Country == "Cuba" }
                //                print("😈😈",newItems)
                
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
        
        
    }
    
    //
    
    func fetchEvent2(National: String){
        
        
        emb.removeAll()
        
        let loca = country()
        
        let predicate = NSPredicate(
            format: "Nationality == %@ && Country == %@",
            National,loca)
        
        let query = CKQuery(recordType:"Country", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = {recordID, result in
            switch result{
            case .success(let record):
                let event = Emb(record: record)
                emb.append(event)
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
        
        
        
    }
}




struct secondMain_Previews: PreviewProvider {
    static var previews: some View {
        secondMain().environmentObject(ViewModel()).environment(\.managedObjectContext,
                                                                 PersistenceController.shared.container.viewContext)
    }
}
