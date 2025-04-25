//
//  ScannerViewController.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//

import UIKit
import AVFoundation

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate
{
    var onFound: ((String) -> Void)?
    
    private let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice)
        if session.canAddInput(videoInput!)
        {
            session.addInput(videoInput!)
        }
        let metadataOutput = AVCaptureVideoPreviewLayer(session: session)
        previewLayer?.frame = view.layer.bounds
        previewLayer?.videoGravity = .resizeAspectFill
        if let layer = previewLayer
        {
            view.layer.addSublayer(layer)
        }
        
        session.startRunning()
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
    {
        session.stopRunning()
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
            let stringValue = object.stringValue
        {
            onFound?(stringValue)
        }
    }
}
