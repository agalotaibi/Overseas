//
//  progressBar.swift
//  Overseas
//
//  Created by Amaal on 27/08/1444 AH.
//

import SwiftUI

struct progressBar: View {

    var body: some View {
        
        VStack{
            
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .yellow)).scaleEffect(3)
            
        }
        
    }
}


struct progressBar_Previews: PreviewProvider {
    static var previews: some View {
        progressBar()
    }
}
