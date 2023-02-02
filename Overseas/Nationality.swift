//
//  Nationality.swift
//  Overseas
//
//  Created by Amaal on 11/07/1444 AH.
//

import SwiftUI

struct Nationality: View {
    @State var options = ["Swift", "Kotlin", "Java", "JavaScript"] // 1
     @State var selectedItem = "Swift"
     
    
    var body: some View {
        VStack {
            Image(systemName: "globe.asia.australia.fill").resizable()
                .scaledToFit()
                .frame(width: 200).padding().foregroundColor(Color("darkBlue"))
            
            
            Text("Pick your Nationality")
                .font(.title2).fontWeight(.semibold).frame(maxWidth: 330,  alignment: .leading).padding(.top)
            
            Picker("Pick your Nationality", selection: $selectedItem) { // 3
                        ForEach(options, id: \.self) { item in // 4
                            Text(item) // 5
                        }
            }.pickerStyle(.wheel)
            
            Spacer()
        }
    }
}

struct Nationality_Previews: PreviewProvider {
    static var previews: some View {
        Nationality()
    }
}
