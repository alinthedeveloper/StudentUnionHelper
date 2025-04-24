//
//  ScannverView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//

import SwiftUI
import AVFoundation
import Vision

// 1. Application main interface
struct ScannerView: View {

        @Binding var scannedString: String
        
        let captureSession = AVCaptureSession()
        
        func makeUIViewController(context: Context) -> UIViewController {
            let viewController = UIViewController()
            
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video),
                  let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice),
                  captureSession.canAddInput(videoInput) else { return viewController }
            
            captureSession.addInput(videoInput)
            
            let videoOutput = AVCaptureVideoDataOutput()
            
            if captureSession.canAddOutput(videoOutput) {
                videoOutput.setSampleBufferDelegate(context.coordinator, queue: DispatchQueue(label: "videoQueue"))
                captureSession.addOutput(videoOutput)
            }
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = viewController.view.bounds
            previewLayer.videoGravity = .resizeAspectFill
            viewController.view.layer.addSublayer(previewLayer)
            
            captureSession.startRunning()
            
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate { }
    }
