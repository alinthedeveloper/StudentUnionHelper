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
                VStack(spacing: 20) {
                    Text("Ready to Navigate")
                        .font(.title)
                        .fontWeight(.semibold)

                    Text("Tap the scan button and hold your camera up to one of the QR codes posted around the building to get started.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Button(action: {
                        showingScanner = true
                        scanModel.clearLocation()
                    }) {
                        Label("Scan QR Code", systemImage: "qrcode.viewfinder")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
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
