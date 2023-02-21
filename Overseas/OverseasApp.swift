//
//  OverseasApp.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI


@main
struct OverseasApp: App {
    
    @StateObject var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
            
            MainPage().environmentObject(vm)
            
          
            
//            MainPage().environment(\.managedObjectContext,
//                                                PersistenceController.shared.container.viewContext)
//            .environmentObject(vm)

        }
    }
}
