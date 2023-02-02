//
//  addCity.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI

struct addCity: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    
    var body: some View {
        
       
        
        VStack {
            Image(systemName: "ellipsis.circle").resizable()
                .scaledToFit()
                .frame(width: 24).frame(maxWidth: 330,  alignment: .trailing).padding(.top)
           
            NavigationStack {
                
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink {
                            Text(name)
                        } label: {
                            Text(name)
                        }
                    }
                }
                .navigationTitle("Countries").scrollContentBackground(.hidden)
            }
            .searchable(text: $searchText) {
                ForEach(searchResults, id: \.self) { result in
                    Text("Are you looking for \(result)?").searchCompletion(result)
                }
        }
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

    struct addCity_Previews: PreviewProvider {
        static var previews: some View {
            addCity()
        }
    }

