//
//  ViewModel.swift
//  Overseas
//
//  Created by ama alothman on 22/07/1444 AH.
//

import SwiftUI
import Foundation



final class ViewModel: ObservableObject{
    @AppStorage("nationality") var nationality = ""
}
