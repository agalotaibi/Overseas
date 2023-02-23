//
//  Nationality.swift
//  Overseas
//
//  Created by Amaal on 11/07/1444 AH.
//

import SwiftUI

struct National: View {
    @State var options = ["Swift", "Kotlin", "Java", "JavaScript"] // 1
     @State var selectedItem = "Swift"
     
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "globe.asia.australia.fill").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 200).padding().padding().foregroundColor(Color("darkBlue"))
            
            Text("Pick your")
                .font(.system(size: 38)).frame(maxWidth: 300, alignment: .leading)
            Text("Nationality")
                .font(.system(size: 38)).fontWeight(.semibold).frame(maxWidth: 300, alignment: .leading)
            
            Divider().frame(width: 340)
//            Picker("Pick your Nationality", selection: $selectedItem) { // 3
//                        ForEach(options, id: \.self) { item in // 4
//                            Text(item) // 5
//                        }
//            }.pickerStyle(.wheel)
            
            //PickerView()
            
            Spacer()
        }
    }
}

struct National_Previews: PreviewProvider {
    static var previews: some View {
        National()
    }
}
