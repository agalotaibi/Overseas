//
//  MainPage.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI
import CloudKit
import CoreData
import Foundation

struct MainPage: View {
    
    @EnvironmentObject var vm : ViewModel
    @State var emer :[Numb] = []
    @State var emer2 :[Numb2] = []
    @State var emb :[Emb] = []
    @State var National = ""
    @State var imageName = ""
    @State private var searchText = ""
    @State private var showingNatio = false
    @State private var showingNotifi = false
    @State var em :[Emergency] = []
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var events: FetchedResults<SavedCountry>
    @State var cityPic = "earth"
    @State var cityName = "France"
    @State var police = 0
    @State var amblance = 0
    @State var fire = 0
    @State private var embassy = ""
    @State private var nation = ""
    @State private var qunsl = ""
    @State private var vistedcont = ""
    let numberString = "111-222-3334" //change
    @AppStorage("onbording")  var shouldshowonb = true
    

    
    var body: some View {
        
        VStack{
        
        NavigationView {
            TabView{
                        
                        firstMain().padding(.vertical, -45.0)
                        
                        secondMain().padding(.vertical, -45.0)
                        
                    
                    
            }.tabViewStyle(PageTabViewStyle()).indexViewStyle(.page(backgroundDisplayMode: .always)).edgesIgnoringSafeArea(.all)
                
        }
            
        }.fullScreenCover(isPresented: $shouldshowonb ){
            Onbording(shouldshowonb: $shouldshowonb)
             }.preferredColorScheme(.dark)//.edgesIgnoringSafeArea(.all)

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




struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()          .environmentObject(ViewModel()).environment(\.managedObjectContext,
                                                                         PersistenceController.shared.container.viewContext)
                    

    }
}

