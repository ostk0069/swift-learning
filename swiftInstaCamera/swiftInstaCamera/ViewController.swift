//
//  ViewController.swift
//  swiftInstaCamera
//
//  Created by Takuma Osada on 2018/06/16.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet var backImageView: UIImageView!
  
  var saveImage:UIImage = UIImage()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  // Segue 準備
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject!) {
    if (segue.identifier == "next") {
      let editVC: EditViewController = (segue.destination as? EditViewController)!
      
      //UIImage型の画像を入れる
      editVC.willEditImage = saveImage
      
      
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
      cameraPicker.allowsEditing = true
      self.present(cameraPicker, animated: true, completion: nil)
      
    }
    else{
      
      print("エラー")
    }
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
      
      backImageView.image = pickedImage
      saveImage = pickedImage
      
      //カメラの決定ボタンが押されたときに遷移
      performSegue(withIdentifier: "next",sender: nil)
      
      //写真を保存
      // アルバムに追加.
      //       UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
    }
    
    //閉じる処理
    picker.dismiss(animated: true, completion: nil)
    
  }
  
  @IBAction func album(_ sender: Any) {
    
    let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
      // インスタンスの作成
      let cameraPicker = UIImagePickerController()
      cameraPicker.sourceType = sourceType
      cameraPicker.delegate = self
      cameraPicker.allowsEditing = true
      self.present(cameraPicker, animated: true, completion: nil)
      
    }
    else{
      print("エラー")
      
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

