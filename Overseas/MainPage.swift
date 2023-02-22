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
    @State var emb :[Emb] = []
    @State var National = ""
    //@State var imageName = ""
    @State private var searchText = ""
    @State private var showingNatio = false
    @State private var showingNotifi = false
    @State var em :[Emergency] = []
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var events: FetchedResults<SavedCountry>
    
    
    
    @AppStorage("onbording")  var shouldshowonb = true
    

    
    var body: some View {
        
        VStack{
        
        NavigationView {
            TabView{
                
                    ZStack {
                        ForEach(emer) { emere  in
                            
//                            emere.bannerImage.resizable().edgesIgnoringSafeArea(.all)
                            
                        }
                        //--------------------------------------- Title
                        VStack {
                            
                            let loca = country()
                            
                            Text("\(loca)")
                            Divider()
                        }
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.top, -310.0)
                        .font(.custom("", fixedSize: 50))
                        .listRowBackground(Color.white)
                        //--------------------------------------- List start
                        VStack{
                            ForEach(emer) { emere  in
                                
                                
                                if emere.Police == emere.Ambulance {
                                    
                                    List{
                                        HStack{
                                            Image("police")
                                                .font(.system(size: 29))
                                            VStack {
                                                Text("Emergency number")
                                                Text("\(emere.Police)")
                                                    .foregroundColor(Color.gray)
                                                    .font(.footnote)
                                                    .padding(.leading, -80)
                                            }.padding(.trailing,70)
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
                                                    // .padding(.leading, 35)
                                                        .foregroundColor(Color.green)
                                                })
                                        }}.scrollContentBackground(.hidden)
                                        .padding(.top, 150.0)
                                        .opacity(0.7)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 21))
                                    
                                    
                                } else {
                                    
                                    List{
                                        
                                        
                                        //---------------------------------------------------- police
                                        HStack{
                                            Image("police")
                                                .font(.system(size: 29))
                                            VStack {
                                                Text("Police")
                                                Text("\(emere.Police)")
                                                    .foregroundColor(Color.gray)
                                                    .font(.footnote)
                                                    .padding(.leading, -30)
                                            }
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
                                                        .padding(.leading, 165)
                                                        .foregroundColor(Color.green)
                                                })
                                        }
                                        //---------------------------------------------------- ambulance
                                        HStack{
                                            Image("ambulance")
                                                .font(.system(size: 29))
                                            VStack {
                                                Text("Ambulance")
                                                Text("\(emere.Ambulance)")
                                                    .foregroundColor(Color.gray)
                                                    .font(.footnote)
                                                    .padding(.leading, -50)
                                                
                                                
                                            }
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
                                                        .padding(.leading, 120)
                                                        .foregroundColor(Color.green)
                                                })
                                        }
                                        //---------------------------------------------------- FireStation
                                        HStack{
                                            Image("fire")
                                                .font(.system(size: 29))
                                            VStack {
                                                Text("Fire Station")
                                                Text("\(emere.Fire)")
                                                    .foregroundColor(Color.gray)
                                                    .font(.footnote)
                                                    .padding(.leading, -50)
                                            }
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
                                                        .padding(.leading, 120)
                                                        .foregroundColor(Color.green)
                                                })
                                        }
                                        //--------------------------------------- First list style
                                    }
                                    .scrollContentBackground(.hidden)
                                    .padding(.top, 150.0)
                                    .opacity(0.7)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 21))
                                }
                            }
                        }
                        //--------------------------------------- End of fist list. Second list start
                        VStack{
                            ForEach(emb) { embe  in
                                let emb2 = embe.Embasy_n.split(separator: "/")
                                
                                List{
                                    if emb2.isEmpty {
                                        
                                        
                                        HStack{
                                            
                                            Image("saudi")
                                                .font(.system(size: 29))
                                            VStack {
                                                Text("Embassy")
                                                
                                                Text(embe.Embasy_n)
                                                    .foregroundColor(Color.gray)
                                                    .font(.footnote)
                                                    .padding(.trailing, -30)
                                            }
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
                                                        .padding(.leading, 140)
                                                        .foregroundColor(Color.green)
                                                })
                                        }
                                        
                                        
                                    }
                                    
                                    else {
                                        
                                        
                                        ForEach(Array(emb2.enumerated()), id: \.offset) { i, element in
                                            //---------------------------------------------------- embaccy
                                            HStack{
                                                
                                                Image("saudi")
                                                    .font(.system(size: 29))
                                                VStack {
                                                    Text("Embassy")
                                                    
                                                    Text(emb2[i])
                                                        .foregroundColor(Color.gray)
                                                        .font(.footnote)
                                                        .padding(.trailing, -30)
                                                }
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
                                                            .padding(.leading, 140)
                                                            .foregroundColor(Color.green)
                                                    })
                                            }
                                        }
                                    }
                                    
                                    
                                    
                                    
                                    if embe.Consulate_no.isEmpty {
                                    }
                                    else {
                                        //---------------------------------------------------- embaccy
                                        HStack{
                                            Image("saudi")
                                                .font(.system(size: 29))
                                            VStack {
                                                Text("Affairs")
                                                Text("\(embe.Consulate_no)")
                                                    .foregroundColor(Color.gray)
                                                    .font(.footnote)
                                                    .padding(.trailing, -15)
                                            }
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
                                                        .padding(.leading, 130)
                                                        .foregroundColor(Color.green)
                                                })
                                        }
                                    }
                                    //--------------------------------------- Second list style
                                }
                                .scrollContentBackground(.hidden)
                                .padding(.top, 430.0)
                                .opacity(0.7)
                                .foregroundColor(Color.black)
                                .font(.system(size: 19))
                            }
                        }
                        VStack{
                            NavigationLink(destination: addCity(),
                                           label: {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color.white)
                            })
                            .buttonStyle(GrowingButton())
                        }
                       
                    }
                    //---------------------------------------------------- Second list done
                ForEach(events){ cont in
                    
                    
                    allCity(cityPic: "france" , cityName: cont.contry ?? "", police: Int(cont.police), amblance: Int(cont.ambulance), fire: Int(cont.fire))}
                    
                }
                
            }.tabViewStyle(.page).preferredColorScheme(.light).onAppear{
                fetchEvent()
                fetchEvent2(National: vm.nationality)

            }
        }.fullScreenCover(isPresented: $shouldshowonb ){
            Onbording(shouldshowonb: $shouldshowonb)
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
    
//
    
    func fetchEvent2(National: String){
       
        
        emb.removeAll()
        
        let loca = country()
        
        print("⛑⛑⛑",National)
        
        let predicate = NSPredicate(
            format: "Nationality == %@ && Country == %@",
            National,loca)

        let query = CKQuery(recordType:"Country", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = {recordID, result in
            print("🌈",loca)
            switch result{
            case .success(let record):
                let event = Emb(record: record)
                emb.append(event)
                print("🌈",loca)
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }

        CKContainer.default().publicCloudDatabase.add(operation)
        
      

    }
}


struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 29))
            .clipShape(Circle())
            .padding(.leading, 290.0)
            .padding(.bottom, 700)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.5), value: configuration.isPressed)
    }
}
//------------------------------------------ custom color
struct CustomColor {
    // static let Text = Color("Text")
    // Add more here...
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()          .environmentObject(ViewModel()).environment(\.managedObjectContext,
                                                                         PersistenceController.shared.container.viewContext)
                    

    }
}


struct Numb: Identifiable{
    let record: CKRecord
    let Ambulance: Int
    let Country: String
    let Fire: Int
    let Police: Int
   // let Image2: CKAsset?
    let id: CKRecord.ID
    
    
    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.Ambulance = record["Ambulance"] as? Int ?? 0
        self.Country = record["Country"] as? String ?? ""
        self.Fire = record["Fire"] as? Int ?? 0
     //   self.Image2 = record["Image"] as? CKAsset
        self.Police = record["Police"] as? Int ?? 0
        
        
    }
    
    
//    var bannerImage : Image{
//       // print(Image2,"🐱")
//        let fileURL = Image2!.fileURL
//            let data = try! Data(contentsOf: fileURL!)
//            let uiImage = UIImage(data: data)!
//            let image = Image(uiImage: uiImage)
//            return image
//
//    }
}

struct GoodsMaster {
       var image:UIImage!
   }


struct Emb: Identifiable{
    let record: CKRecord
    let Consulate_no: String
    let Country: String
    let Embasy_n: String
    let Nationality: String
    let id: CKRecord.ID

    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.Consulate_no = record["Consulate_no"] as? String ?? ""
        self.Country = record["Country"] as? String ?? ""
        self.Embasy_n = record["Embasy_n"] as? String ?? ""
        self.Nationality = record["Nationality"] as? String ?? ""
        

    }



}

struct allCity: View {

    @State var cityPic = "france"
    @State var cityName = "France"
    @State var police = 0
    @State var amblance = 0
    @State var fire = 0
    @State var em :[Emergency] = []
    let numberString = "111-222-3334" //change

    var body: some View {
        
        
        ZStack (alignment: .leading){
            
            Image(cityPic).resizable().scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity).padding(.top, -50)
            
            VStack{
                NavigationLink(destination: addCity(),
                               label: {
                    Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35).frame(maxWidth: 330, maxHeight: 100,  alignment: .trailing).foregroundColor(Color.white)
                    
                    
                })
  
                
                VStack {
                    Text(cityName)
                    
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("", fixedSize: 50))
                .listRowBackground(Color.white)
                
                
                VStack
                {
                    List{
                        //---------------------------------------------------- police
                        HStack(alignment: .center){
                            Image("police1").resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                            VStack(alignment: .leading) {
                                Text("Police")
                                Text(String(police))
                                    .foregroundColor(Color.gray)
                                    .font(.footnote)
                            }
                            Spacer()
                            Button(
                                action: {
                                    let telephone = "tel://"
                                    let formattedString = telephone + String(police)
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
                                Text(String(amblance))
                                    .foregroundColor(Color.gray)
                                    .font(.footnote)
                            }
                            Spacer()
                            Button(
                                action: {
                                    let telephone = "tel://"
                                    let formattedString = telephone + String(amblance)
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
                                Text(String(fire))
                                    .foregroundColor(Color.gray)
                                    .font(.footnote)
                            }
                            Spacer()
                            Button(
                                action: {
                                    let telephone = "tel://"
                                    let formattedString = telephone + String(fire)
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
                        //--------------------------------------- First list style
                    }
                    .scrollContentBackground(.hidden)
                    .opacity(0.7)
                    .foregroundColor(Color.black)
                    .font(.system(size: 21))
                }
                
                
                VStack
                {
                    List{
                        //---------------------------------------------------- embaccy
                        HStack(alignment: .center){
                            Image("emb")
                                .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                            VStack(alignment: .leading) {
                                Text("Embassy")
                                Text("+665-495-3467")
                                    .foregroundColor(Color.gray)
                                    .font(.footnote)
                            }
                            Spacer()
                            Button(
                                action: {
                                    let telephone = "tel://"
                                    let formattedString = telephone + numberString
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
                        //---------------------------------------------------- embaccy
                        HStack(alignment: .center){
                            Image("quns")
                                .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                            VStack (alignment: .leading){
                                Text("Consulent")
                                Text("+665-374-3785")
                                    .foregroundColor(Color.gray)
                                    .font(.footnote)
                            }
                            
                            Spacer()
                            Button(
                                action: {
                                    let telephone = "tel://"
                                    let formattedString = telephone + numberString
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
                        //--------------------------------------- Second list style
                    }
                    .scrollContentBackground(.hidden)
                    .opacity(0.7)
                    .foregroundColor(Color.black)
                    .font(.system(size: 19))
                }
                
                
            }
        }
        
    }
    }


