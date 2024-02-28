//
//  MVVM_To_DoApp.swift
//  MVVM To_Do
//
//  Created by Chandra on 05/02/24.
//

import SwiftUI

@main
struct MVVM_To_DoApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
