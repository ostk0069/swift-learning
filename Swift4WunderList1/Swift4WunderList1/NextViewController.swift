//
//  NextViewController.swift
//  Swift4WunderList1
//
//  Created by Takuma Osada on 2018/06/14.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITextViewDelegate {

    var selectedNumber = 0
  
  @IBOutlet var textView: UITextView!
  
  var screenShotImage: UIImage = UIImage()

  var titleArray: Array = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // get the title array from the app
    if UserDefaults.standard.object(forKey: "array") != nil {
      
      titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
      
      textView.text = titleArray[selectedNumber]
    }
    
  }
  
  // take screenshot
  func takeScreenShot() {
    
  }
  
  // close the keyboard with in touch
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if textView.isFirstResponder {
      
      textView.resignFirstResponder()
    }
  }
  
  @IBAction func shareLINE(_ sender: Any) {
    
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
