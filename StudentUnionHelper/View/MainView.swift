//
//  MainView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//  Main app view that uses NavViewModel and ScannerViewModel

import SwiftUI
import CoreLocation


struct MainView: View {
    @EnvironmentObject var navModel: NavViewModel
    @EnvironmentObject var scanModel: ScannerViewModel
    @State private var showingScanner = false
    @State private var showingAR = false

    var body: some View {
        VStack {
            if let location = scanModel.currentLocation {
                ARView()
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("Scan a QR code to begin")

                Button("Scan") {
                    showingScanner = true
                }
                .sheet(isPresented: $showingScanner) {
                    CameraView { scannedCode in
                        scanModel.setLocation(from: scannedCode)
                        showingScanner = false
                        print("Scanned ID: '\(scannedCode)'")
                        showingAR = true
                    }
                    .environmentObject(scanModel)
                }
            }
        }
    }
}
