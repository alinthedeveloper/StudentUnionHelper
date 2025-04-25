//
//  MainView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//  Main app view that uses NavViewModel and ScannerViewModel

import SwiftUI
import CoreLocation


struct MainView: View {
    @EnvironmentObject var NavViewModel: NavViewModel
    @EnvironmentObject var scannerViewModel: ScannerViewModel
    
    var body: some View {
        VStack {
            if let location = NavViewModel.currentLocation {Text("You're at: \(location.name)")
            }
            else {
                Text("Scan a QR code to begin")
            }
        }
    }
}
