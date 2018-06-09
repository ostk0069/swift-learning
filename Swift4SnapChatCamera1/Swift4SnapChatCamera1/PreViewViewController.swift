//
//  PreViewViewController.swift
//  Swift4SnapChatCamera1
//
//  Created by Takuma Osada on 2018/06/09.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class PreViewViewController: UIViewController {
  
  var image: UIImage?

  @IBOutlet var imageView: UIImageView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

    imageView.image = image
    }

  @IBAction func save(_ sender: Any) {
    
    UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func cancel(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
    
  }
  
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
