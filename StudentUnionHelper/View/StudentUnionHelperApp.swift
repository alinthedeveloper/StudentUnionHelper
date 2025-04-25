//
//  StudentUnionHelperApp.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//  app entry point sets up environment objects

import SwiftUI
import SwiftData

@main
struct StudentUnionHelperApp: App {
    @StateObject var viewModel = NavViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
