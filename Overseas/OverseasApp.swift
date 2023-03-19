//
//  OverseasApp.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI


@main
struct OverseasApp: App {
    let persistenceController = PersistenceController.shared
    //@Environment(\.colorScheme) var colorScheme
    @StateObject var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
            
            MainPage().environmentObject(vm).environment(\.managedObjectContext, persistenceController.container.viewContext).environment(\.colorScheme, .dark)
                //.colorScheme(.dark)
                //.preferredColorScheme(.dark)
            
          
            
//            MainPage().environment(\.managedObjectContext,
//                                                PersistenceController.shared.container.viewContext)
//            .environmentObject(vm)

        }
    }
}
