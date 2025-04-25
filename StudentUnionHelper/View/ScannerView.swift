//
//  ScannverView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//  Launches the camera and scans QR codes
//  Sends the result to NavViewModel.updateLocation

import SwiftUI
import AVFoundation
import Vision

struct ScannerView: View {
    @EnvironmentObject var navViewModel: NavViewModel
    @Binding var scannedString: String
    
    let captureSession = AVCaptureSession()
    
    var body: some View {
        VStack{
            
        }
    }
}
     
