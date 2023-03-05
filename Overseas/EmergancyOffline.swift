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
    private var emerNum: FetchedResults<SavedCountry>
    @State var emer2 :[Numb2] = []
    @EnvironmentObject var vm : ViewModel
    @State var National = ""
    @State var emer :[Numb] = []
    @State var emb :[Emb] = []
    @State var Unified = Int64()
    @State var ploices = Int64()
    @State var emblances = Int64()
    @State var firS = Int64()
    
    var body: some View {
        
            if ploices == emblances {
                
                HStack(alignment: .center){
                    Image("unif").resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                    VStack(alignment: .leading) {
                        Text("Unified Number")
                        Text(String(Unified))
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + String(Unified)
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
                        Text(String(ploices))
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + String(ploices)
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
                        Text(String(emblances))
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + String(emblances)
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
                        Text(String(firS))
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + String(firS)
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

struct EmergancyOffline_Previews: PreviewProvider {
    static var previews: some View {
        EmergancyOffline()
    }
}
