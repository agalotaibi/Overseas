//
//  EmptyState.swift
//  Overseas
//
//  Created by Amaal on 24/08/1444 AH.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    NavigationLink{
                        addCity()
                    }label: {
                        Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50).foregroundColor(Color("yellow"))
                    }.padding()
                    
                    
                    Text("Welcome to Overseas")
                        .font(.title)
                        .fontWeight(.regular).foregroundColor(.gray).padding(.bottom, -4.0)
                    Text("Click the + so you can add Visted Country")
                        .font(.body).foregroundColor(.gray)
                }
            }
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
