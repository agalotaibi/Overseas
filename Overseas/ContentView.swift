//
//  ContentView.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm : ViewModel
    
    var body: some View {
        VStack{
            
            MainPage().environmentObject(ViewModel())
        }
                  }
              
      }

  


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
