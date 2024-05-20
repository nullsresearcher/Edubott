//
//  ScanDocumentViewModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-19.
//

import AVFoundation
import CoreImage

class ScanDocumentViewModel: NSObject, ObservableObject {
    @Published var image: CGImage?
    private var permissionGranted = false
    private var captureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private let context = CIContext()
    
    override init() {
        super.init()
        checkPermission()
        sessionQueue.async { [unowned self] in
            self.setupCaptureSession()
            self.captureSession.startRunning()
        }
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                permissionGranted = true
        case .notDetermined:
            requestPermission()
        default:
            permissionGranted = false
            
        }
    }
    func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in self.permissionGranted = granted
            
        }
    }
    
    func setupCaptureSession() {
        let photoOutput = AVCaptureVideoDataOutput()
        guard permissionGranted else { return }
        guard let photoDevice = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) else { return}
        guard let photoDeviceInput = try? AVCaptureDeviceInput(device: photoDevice) else { return }
        guard captureSession.canAddInput(photoDeviceInput) else { return }
        captureSession.addInput(photoDeviceInput)
        photoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferAQueue"))
        captureSession.addOutput(photoOutput)
        photoOutput.connection(with: .video)?.videoRotationAngle = 90
    }
}

extension ScanDocumentViewModel: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let cgImage = imageFromSampleBuffer(sampleBuffer: sampleBuffer) else { return }
        DispatchQueue.main.async { [unowned self] in
            self.image = cgImage
        }
    }
    
    private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> CGImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil}
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil}
        return cgImage
    }
}
