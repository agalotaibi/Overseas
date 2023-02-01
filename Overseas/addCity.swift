//
//  addCity.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI

struct addCity: View {
    @State private var searchTerm = ""
    
    var body: some View {
        VStack{
            NavigationView {
                
                VStack {
                    Text ("Find a developer").font(.title.weight (.bold))
                    Text ("Start searching for a developer to make your app.").navigationTitle ("Search")
                    
                    
                }
                
                
            }.searchable(text: $searchTerm)
        }
    }
}
    
    struct addCity_Previews: PreviewProvider {
        static var previews: some View {
            addCity()
        }
    }

