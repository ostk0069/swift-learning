//
//  NextViewController.swift
//  Swift4WunderList1
//
//  Created by Takuma Osada on 2018/06/14.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITextViewDelegate, UIDocumentInteractionControllerDelegate {
  
    lazy private var documentInteractionController = UIDocumentInteractionController()

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
  
  // close the keyboard with in touch
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if textView.isFirstResponder {
      
      textView.resignFirstResponder()
    }
  }
  
  // take screenshot
  func takeScreenShot() {
    
    // キャプチャしたい枠を決める
    let rect = CGRect(x: textView.frame.origin.x, y: textView.frame.origin.y, width: textView.frame.width, height: textView.frame.height)
    
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    textView.drawHierarchy(in: rect, afterScreenUpdates: true)
    screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
  }

  @IBAction func shareLINE(_ sender: Any) {
    
    takeScreenShot()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      
      let pastBoard: UIPasteboard = UIPasteboard.general
      
      pastBoard.setData(UIImageJPEGRepresentation(self.screenShotImage, 0.75)!, forPasteboardType: "public.png")
      
      let lineUrlString: String = String(format: "line://msg/image/%@", pastBoard.name as CVarArg)
      
      UIApplication.shared.open(NSURL(string: lineUrlString)! as URL)
      
    }
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
