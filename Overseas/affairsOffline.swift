//
//  affairsOffline.swift
//  Overseas
//
//  Created by Amaal on 13/08/1444 AH.
//

import SwiftUI
import CoreData
import CloudKit

struct affairsOffline: View {
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
        HStack(alignment: .center){
            Image("emb")
                .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
            VStack(alignment: .leading) {
                Text("Embassy")
                Text(cont.embassy ?? "")
                    .foregroundColor(Color.gray)
                    .font(.footnote)
            }
            Spacer()
            Button(
                action: {
                    let telephone = "tel://"
                    let formattedString = telephone + (cont.embassy ?? "") ?? ""
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
        
        if ((cont.qunsl?.isEmpty) != nil){
            
        }
            else{
                HStack(alignment: .center){
                    Image("quns")
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                    VStack (alignment: .leading){
                        Text("Citizen Affairs")
                        Text(cont.qunsl ?? "")
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + (cont.qunsl ?? "" ) ?? ""
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
                //----------------------------
            }
        }
        
    }
}

struct affairsOffline_Previews: PreviewProvider {
    static var previews: some View {
        affairsOffline()
    }
}
