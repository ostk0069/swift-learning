//
//  ViewController.swift
//  Swift4Camera1
//
//  Created by Takuma Osada on 2018/06/09.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // ask user to allow use the camera
    PHPhotoLibrary.requestAuthorization { (status) in

      switch (status) {
        
      case .authorized:
        print("authorized")
        
      case .denied:
        print("denied")
        
      case .notDetermined:
        print("not determined")
        
      case .restricted:
        print("restricted")
        
      }
      
    }
  }
  
  @IBAction func camera(_ sender: Any) {
    
    let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
    // カメラが利用可能かチェック
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
      // インスタンスの作成
      let cameraPicker = UIImagePickerController()
      cameraPicker.sourceType = sourceType
      cameraPicker.delegate = self
      self.present(cameraPicker, animated: true, completion: nil)
      
    }
    
  }
  
  @IBAction func album(_ sender: Any) {
    
    let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
    
    // アルバムが利用可能かチェック
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
      // インスタンスの作成
      let cameraPicker = UIImagePickerController()
      cameraPicker.sourceType = sourceType
      cameraPicker.delegate = self
      self.present(cameraPicker, animated: true, completion: nil)
      
    }
    
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage {
      
      imageView.image = picker
      
      // アルバムに追加.
      UIImageWriteToSavedPhotosAlbum(picker, self, nil, nil)
    }
    
    //カメラ画面(アルバム画面)を閉じる処理
    picker.dismiss(animated: true, completion: nil)
    
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    
    picker.dismiss(animated: true, completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

