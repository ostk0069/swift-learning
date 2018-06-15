//
//  SettingViewController.swift
//  Swift4WunderList1
//
//  Created by Takuma Osada on 2018/06/14.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

  @IBOutlet var sv: UIScrollView!
  @IBOutlet var backImageView: UIImageView!
  
  var vc = UIView()
  
  override func viewDidLoad() {
        super.viewDidLoad()

        vc.frame = CGRect(x: 0, y: 0, width: 800, height: 80)
    
        for i in 0..<10 {
          
          let button: UIButton = UIButton()
          button.tag = i
          button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
          
          let buttonImage: UIImage = UIImage(named: String(i) + ".jpg")!
          button.setImage(buttonImage, for: .normal)
          button.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
          vc.addSubview(button)
          
        }
    
        sv.addSubview(vc)
        sv.contentSize = vc.bounds.size
    }
  
  @objc func selectImage(sender:UIButton) {
    
    // show the image in the UIImageView
    backImageView.image = UIImage(named: String(sender.tag) + ".jpg")
    
    // save the information of tag of button in app
    UserDefaults.standard.set(String(sender.tag), forKey: "image")
  
  }
  
  @IBAction func back(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
