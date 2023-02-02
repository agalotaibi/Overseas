//
//  Notification.swift
//  Overseas
//
//  Created by Amaal on 11/07/1444 AH.
//

import SwiftUI

struct Notification: View {
    @State var options = ["Swift", "Kotlin", "Java", "JavaScript"]
    var body: some View {
        VStack{
            List {
                ForEach(options, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
            .navigationTitle("Countries").scrollContentBackground(.hidden)
        
        }
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}
