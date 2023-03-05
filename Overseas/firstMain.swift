//
//  firstMain.swift
//  Overseas
//
//  Created by Amaal on 13/08/1444 AH.
//

import SwiftUI
import CloudKit
import CoreData

struct firstMain: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var events: FetchedResults<SavedCountry>
    @State var emer2 :[Numb2] = []
    @EnvironmentObject var vm : ViewModel
    @State var National = ""
    @State var emer :[Numb] = []
    @State var emb :[Emb] = []
    
    var body: some View {
        
        VStack{
            ZStack{
                ForEach(emer) { emere  in
                    
                    emere.bannerImage.resizable().scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity).padding(.top, -50).overlay( Rectangle().fill(
                            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.7), .black.opacity(0.5),
                                                                       .black.opacity(0.3),
                                                                       .black.opacity(0.3),.black.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
                        )).ignoresSafeArea(.all)
                    
                }
                
                
                VStack{
                    NavigationLink(destination: addCity(),
                                   label: {
                        Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35).frame(maxWidth: 330, maxHeight: 270,  alignment: .trailing).foregroundColor(Color.white)
                    })
                    
                    let loca = country()
                    
                    Text("\(loca)").foregroundColor(Color.white)
                        .bold()
                        .font(.custom("", fixedSize: 50)).padding(.top, -100.0)
                    
                    VStack{
                        List{
                            ForEach(emer) { emere  in
                                
                                Section(header: Text("\(emere.Country) Emergency Numbers")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white).opacity(1.0)){
                                        
                                        if emere.Police == emere.Ambulance {
                                            HStack(alignment: .center){
                                                
                                                Image("unif").resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                                                
                                                VStack(alignment: .leading){
                                                    Text("Emergency number")
                                                    Text("\(emere.Police)")
                                                        .foregroundColor(Color.gray)
                                                        .font(.footnote)
                                                }
                                                
                                                Spacer()
                                                Button(
                                                    action: {
                                                        let telephone = "tel://"
                                                        let formattedString = telephone + String(emere.Police)
                                                        guard let url = URL(string: formattedString) else { return }
                                                        UIApplication.shared.open(url)
                                                    },
                                                    label: {
                                                        Image(systemName: "phone.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 40.0)
                                                            .foregroundColor(Color.green)
                                                    })
                                                
                                            }
                                            
                                        }
                                        
                                        else {
                                            let loca = country()
                                            HStack(alignment: .center){
                                                Image("police1")
                                                    .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                                                VStack(alignment: .leading) {
                                                    Text("Police")
                                                    Text("\(emere.Police)")
                                                        .foregroundColor(Color.gray)
                                                        .font(.footnote)
                                                    
                                                }
                                                Spacer()
                                                Button(
                                                    action: {
                                                        let telephone = "tel://"
                                                        let formattedString = telephone + String(emere.Police)
                                                        guard let url = URL(string: formattedString) else { return }
                                                        UIApplication.shared.open(url)
                                                    },
                                                    label: {
                                                        Image(systemName: "phone.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 40.0)
                                                            .foregroundColor(Color.green)
                                                    })
                                            }
                                            //---------------------------------------------------- ambulance
                                            HStack(alignment: .center){
                                                Image("ambl")
                                                    .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                                                VStack(alignment: .leading) {
                                                    Text("Ambulance")
                                                    Text("\(emere.Ambulance)")
                                                        .foregroundColor(Color.gray)
                                                        .font(.footnote)
                                                    
                                                    
                                                    
                                                }
                                                Spacer()
                                                Button(
                                                    action: {
                                                        
                                                        let telephone = "tel://"
                                                        let formattedString = telephone + String(emere.Ambulance)
                                                        guard let url = URL(string: formattedString) else { return }
                                                        UIApplication.shared.open(url)
                                                    },
                                                    label: {
                                                        Image(systemName: "phone.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 40.0)
                                                            .foregroundColor(Color.green)
                                                    })
                                            }
                                            //---------------------------------------------------- FireStation
                                            HStack(alignment: .center){
                                                Image("fire1")
                                                    .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                                                VStack(alignment: .leading) {
                                                    Text("Fire Station")
                                                    Text("\(emere.Fire)")
                                                        .foregroundColor(Color.gray)
                                                        .font(.footnote)
                                                    
                                                }
                                                Spacer()
                                                Button(
                                                    action: {
                                                        let telephone = "tel://"
                                                        let formattedString = telephone + String(emere.Fire)
                                                        guard let url = URL(string: formattedString) else { return }
                                                        UIApplication.shared.open(url)
                                                    },
                                                    label: {
                                                        Image(systemName: "phone.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 40.0)
                                                            .foregroundColor(Color.green)
                                                    })
                                            }
                                            
                                        }
                                    }.listRowBackground(Color.white)
                                
                                ForEach(emb) { embe  in
                                    let emb2 = embe.Embasy_n.split(separator: "/")
                                    
                                    Section(header: Text("\(vm.nationality) Foreign Affairs")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white).opacity(1.0)){
                                            
                                            if emb2.isEmpty {
                                                
                                                HStack(alignment: .center){
                                                    
                                                    Image("emb")
                                                        .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                                                    VStack (alignment: .leading){
                                                        Text("Embassy")
                                                        
                                                        Text(embe.Embasy_n)
                                                            .foregroundColor(Color.gray)
                                                            .font(.footnote)
                                                        
                                                    }
                                                    Spacer()
                                                    Button(
                                                        action: {
                                                            let telephone = "tel://"
                                                            let formattedString = telephone + embe.Embasy_n
                                                            guard let url = URL(string: formattedString) else { return }
                                                            UIApplication.shared.open(url)
                                                        },
                                                        label: {
                                                            Image(systemName: "phone.circle.fill")
                                                                .resizable()
                                                                .scaledToFit()
                                                                .frame(width: 40.0)
                                                                .foregroundColor(Color.green).opacity(1.0)
                                                        })
                                                }
                                                
                                                
                                            }
                                            
                                            else {
                                                
                                                
                                                ForEach(Array(emb2.enumerated()), id: \.offset) { i, element in
                                                    //---------------------------------------------------- embaccy
                                                    HStack(alignment: .center){
                                                        
                                                        Image("emb")
                                                            .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                                                        VStack(alignment: .leading) {
                                                            Text("Embassy")
                                                            
                                                            Text(emb2[i])
                                                                .foregroundColor(Color.gray)
                                                                .font(.footnote)
                                                            
                                                        }
                                                        Spacer()
                                                        Button(
                                                            action: {
                                                                let telephone = "tel://"
                                                                let formattedString = telephone + emb2[i]
                                                                guard let url = URL(string: formattedString) else { return }
                                                                UIApplication.shared.open(url)
                                                            },
                                                            label: {
                                                                Image(systemName: "phone.circle.fill")
                                                                    .resizable()
                                                                    .scaledToFit()
                                                                    .frame(width: 40.0)
                                                                
                                                                    .foregroundColor(Color.green)
                                                            })
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            if embe.Consulate_no.isEmpty {
                                            }
                                            else {
                                                //---------------------------------------------------- embaccy
                                                HStack(alignment: .center){
                                                    Image("quns")
                                                        .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                                                    VStack(alignment: .leading){
                                                        Text("Citizen Affairs")
                                                        Text("\(embe.Consulate_no)")
                                                            .foregroundColor(Color.gray)
                                                            .font(.footnote)
                                                        
                                                    }
                                                    Spacer()
                                                    Button(
                                                        action: {
                                                            let telephone = "tel://"
                                                            let formattedString = telephone + embe.Consulate_no
                                                            guard let url = URL(string: formattedString) else { return }
                                                            UIApplication.shared.open(url)
                                                        },
                                                        label: {
                                                            Image(systemName: "phone.circle.fill")
                                                                .resizable()
                                                                .scaledToFit()
                                                                .frame(width: 40.0)
                                                                .foregroundColor(Color.green)
                                                        })
                                                }
                                                
                                                
                                            }
                                            
                                        }.listRowBackground(Color.white)
                                }
                                
                            }
                        }.scrollContentBackground(.hidden)
                            .opacity(0.8)
                            .foregroundColor(Color.black)
                            .font(.system(size: 19))
                    }.padding(.top, -50.0)
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

struct firstMain_Previews: PreviewProvider {
    static var previews: some View {
        firstMain().environmentObject(ViewModel()).environment(\.managedObjectContext,
                                                                PersistenceController.shared.container.viewContext)
    }
}
