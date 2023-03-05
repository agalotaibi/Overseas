//
//  EmergancyOffline.swift
//  Overseas
//
//  Created by Amaal on 13/08/1444 AH.
//

import SwiftUI
import CoreData
import CloudKit

struct EmergancyOffline: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var events: FetchedResults<SavedCountry>
    @State var emer2 :[Numb2] = []
    @EnvironmentObject var vm : ViewModel
    @State var National = ""
    @State var emer :[Numb] = []
    @State var emb :[Emb] = []
    var body: some View {
        
        ForEach(events){ cont in
            if cont.police == cont.ambulance {
                
                HStack(alignment: .center){
                    Image("unif").resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                    VStack(alignment: .leading) {
                        Text("Unified Number")
                        Text(String(cont.police))
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + String(cont.police)
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
            else{
                HStack(alignment: .center){
                    Image("police1").resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                    VStack(alignment: .leading) {
                        Text("Police")
                        Text(String(cont.police))
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + String(cont.police)
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
                        Text(String(cont.ambulance))
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + String(cont.ambulance)
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
                        Text(String(cont.fire))
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + String(cont.fire)
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
            } //--------------------------------------- First list style
            
        }
    }
}

struct EmergancyOffline_Previews: PreviewProvider {
    static var previews: some View {
        EmergancyOffline()
    }
}
