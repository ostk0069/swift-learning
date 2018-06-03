//
//  ViewController.swift
//  swift4KeyBoard1
//
//  Created by Takuma Osada on 2018/06/03.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var passwordTestField: UITextField!
  @IBOutlet var resultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTextField.delegate = self
    passwordTestField.delegate = self
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    
    return true
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    emailTextField.resignFirstResponder()
    passwordTestField.resignFirstResponder()
    
  }
  
  @IBAction func signin(_ sender: Any) {
    
    resultLabel.text = emailTextField.text! + " " + passwordTestField.text!
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

