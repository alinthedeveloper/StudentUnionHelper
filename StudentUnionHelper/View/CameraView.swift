//
//  CameraView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    
    var onFound: (String) -> Void
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        let vc = ScannerViewController()
        vc.onFound = onFound
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}
}
