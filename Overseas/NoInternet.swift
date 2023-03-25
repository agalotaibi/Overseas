//
//  NoInternet.swift
//  Overseas
//
//  Created by Amaal on 04/09/1444 AH.
//

import SwiftUI

struct NoInternet: View {
    var body: some View {
        VStack{
            Image(systemName: "wifi.slash").resizable().aspectRatio(contentMode: .fit).frame(width: 50).foregroundColor(Color("yellow")).padding()
            
            Text("No internet connection").foregroundColor(.gray)
            Text("Please, Connect to the internet").foregroundColor(.gray)
        }
    }
}

struct NoInternet_Previews: PreviewProvider {
    static var previews: some View {
        NoInternet()
    }
}
