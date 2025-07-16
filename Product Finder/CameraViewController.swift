//
//  CameraViewController.swift
//  Product Finder
//
//  Created by user279679 on 7/16/25.
//

import Foundation
import AVFoundation
import SwiftUI
class CameraViewController: UIViewController {
    private let captureSession = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer!
    override func viewDidLoad(){
        super.viewDidLoad()
        configureCaptureSession()
        setupPreviewLayer()
        captureSession.startRunning()
        
    }
    
    private func configureCaptureSession(){
        captureSession.sessionPreset = .photo
        
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else{
            print("No Camera available")
            return
        }
        
        guard let videoInput = try? AVCaptureDeviceInput(device: videoDevice) else{
            print("Cannot create input from camera")
            return
        }
        
        if captureSession.canAddInput(videoInput){
            captureSession.addInput(videoInput)
        }
    }
    
    private func setupPreviewLayer(){
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
    }
}
