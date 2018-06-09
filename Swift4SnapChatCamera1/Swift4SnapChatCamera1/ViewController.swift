//
//  ViewController.swift
//  Swift4SnapChatCamera1
//
//  Created by Takuma Osada on 2018/06/09.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController, AVCapturePhotoCaptureDelegate {
  
  var captureSession = AVCaptureSession()
  
  var backCamera:AVCaptureDevice?
  
  var frontCamera:AVCaptureDevice?
  
  var currentCamera:AVCaptureDevice?
  
  var photoOutput:AVCapturePhotoOutput?
  
  var cameraPreviewLayer:AVCaptureVideoPreviewLayer?
  
  var image:UIImage?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // show pemmsion modal
    
    PHPhotoLibrary.requestAuthorization { (status) in
      switch (status) {
      case .authorized:
        print("authorized")
      case .denied:
        print("denied")
      case .notDetermined:
        print("notDetermined")
      case .restricted:
        print("restricted")
      }
    
    }
    
    setUpCaptureSession()
    setUpDevice()
    setUpInputOutput()
    setUpPreViewLayer()
    startRunningCaptureSession()
    
  }
  
  func setUpCaptureSession() {
    captureSession.sessionPreset = AVCaptureSession.Preset.photo
  }
  
  func setUpDevice() {
    
    let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes:
      
      [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified
    
    )
    
    let devices = deviceDiscoverySession.devices
    
    for device in devices {
      
      if device.position == AVCaptureDevice.Position.back {
        backCamera = device
      }
      else if device.position == AVCaptureDevice.Position.front {
        frontCamera = device
      }
    }
    
    currentCamera = backCamera
    
  }
  
  func setUpInputOutput(){
    do {
      let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
      captureSession.addInput(captureDeviceInput)
      
      photoOutput = AVCapturePhotoOutput()
      
      
      photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format:[AVVideoCodecKey:AVVideoCodecType.jpeg])], completionHandler: nil)
      captureSession.addOutput(photoOutput!)
      
      
    } catch  {
      print(error)
    }
  }
  
  func setUpPreViewLayer(){
    cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
    cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
    cameraPreviewLayer?.frame = self.view.frame
    self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
  }
  
  func startRunningCaptureSession(){
    captureSession.startRunning()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "next" {
      
      let preVC = segue.destination as! PreViewViewController
      preVC.image = self.image!
    }
  }
  
  func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
    if let imageData = photo.fileDataRepresentation() {
      image = UIImage(data: imageData)
      performSegue(withIdentifier: "next", sender: nil)
    }
  }
  
  @IBAction func camera(_ sender: Any) {
    
    let settings = AVCapturePhotoSettings()
    photoOutput?.capturePhoto(with: settings, delegate: self)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

