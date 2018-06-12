//
//  ProfileViewController.swift
//  Swift4LINELogin
//
//  Created by Takuma Osada on 2018/06/12.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit
import LineSDK
import SDWebImage

class ProfileViewController: UIViewController {
  
    var displayName = String()
    var statusMessage = String()
    var pictureUrlString = String()
  
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

      userNameLabel.text = displayName
      imageView.sd_setImage(with: URL(string: pictureUrlString))
      imageView.layer.cornerRadius = 8.0
      imageView.clipsToBounds = true
      
      textView.text = statusMessage
      
    }
  
    @IBAction func logout(_ sender: Any) {
      
      let apiClient = LineSDKAPI(configuration: LineSDKConfiguration.defaultConfig())
      
      apiClient.logout(queue: .main) { (success, error) in
        
        if error != nil {
          print(error?.localizedDescription ?? "")
          return
        }
        
        if success {
          self.dismiss(animated: true, completion: nil)
        }
      }
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
