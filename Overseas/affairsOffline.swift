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
    @State var embassC = ""
    @State var affairsC = ""
    
    var body: some View {
        
        
        HStack(alignment: .center){
            Image("emb")
                .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
            VStack(alignment: .leading) {
                Text("Embassy")
                Text(embassC ?? "")
                    .foregroundColor(Color.gray)
                    .font(.footnote)
            }
            Spacer()
            Button(
                action: {
                    let telephone = "tel://"
                    let formattedString = telephone + (embassC ?? "") ?? ""
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
        
        if ((affairsC.isEmpty) != nil){
            
        }
            else{
                HStack(alignment: .center){
                    Image("quns")
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                    VStack (alignment: .leading){
                        Text("Citizen Affairs")
                        Text(affairsC ?? "")
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                    }
                    
                    Spacer()
                    Button(
                        action: {
                            let telephone = "tel://"
                            let formattedString = telephone + (affairsC ?? "" ) ?? ""
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

struct affairsOffline_Previews: PreviewProvider {
    static var previews: some View {
        affairsOffline()
    }
}
