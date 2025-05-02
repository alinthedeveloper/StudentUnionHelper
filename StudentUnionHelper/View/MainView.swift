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
                ZStack(alignment: .topTrailing) {
                    ARView(location: location)
                        .edgesIgnoringSafeArea(.all)

                    Button(action: {
                        showingScanner = true
                        scanModel.clearLocation()
                    }) {
                        Image(systemName: "qrcode.viewfinder")
                            .font(.system(size: 24))
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            .padding()
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
            } else {
                Text("Scan a QR code to begin")

                Button("Scan") {
                    showingScanner = true
                    scanModel.clearLocation()
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
