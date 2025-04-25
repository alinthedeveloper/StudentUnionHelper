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
    @State private var showingScanner: Bool = false
    
    var body: some View {
        VStack {
            if let location = NavViewModel.currentLocation {Text("You're at: \(location.name)")
            }
            else {
                Text("Scan a QR code to begin")
                    .sheet(isPresented: $showingScanner){
                        CameraView {
                            scannedCode in scannerViewModel.setLocation (from: scannedCode)
                            showingScanner = false
                        }
                    }
                Button("Scan")
                {
                    showingScanner = true
                }
            }
        }
    }
}
