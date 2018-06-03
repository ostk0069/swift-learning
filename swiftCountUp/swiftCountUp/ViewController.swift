//
//  ViewController.swift
//  swiftCountUp
//
//  Created by Takuma Osada on 2018/06/03.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var countLabel: UILabel!
  
  var resultBox = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func plus(_ sender: Any) {
    resultBox = resultBox + 1
    
    countLabel.text = String(resultBox)
    
  }
  
  @IBAction func minus(_ sender: Any) {
    resultBox = resultBox - 1
    
    countLabel.text = String(resultBox)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

