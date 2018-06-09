//
//  ViewController.swift
//  Swift4MagicPush1
//
//  Created by Takuma Osada on 2018/06/08.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet var nameTextField: UITextField!
  
  @IBOutlet var bodyTextField: UITextField!
  
  let timerNotificationIdentifier = "id1"
  
  var resultString = ""
  var ketugouString = " "
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.delegate = self
    bodyTextField.delegate = self
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    // connect the name and body as one
    resultString =  nameTextField.text! + ketugouString + bodyTextField.text!
    
    // close the keyboard
    textField.resignFirstResponder()
    
    return true
  }
  
  func startPush() {
    
    // send push notification after 5 sec
    // need permission to send notification
    
    UNUserNotificationCenter.current().getNotificationSettings { (settings) in
      
      if (settings.authorizationStatus == .authorized) {
        
          // notificate
          self.push()
      }
      else {
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .alert], completionHandler: { (granted, error) in
          
          if let error = error {
            print(error)
          }
          else {
            if (granted) {
              self.push()
            }
          }
        })
      }
    }
    
  }
  
  @IBAction func tap(_ sender: Any) {
    
    startPush()
  }
  
  func push() {
    
    // set the string in the textfield
    let content = UNMutableNotificationContent()
    content.title = nameTextField.text!
    content.subtitle = bodyTextField.text!
    
    let timerIconURL = Bundle.main.url(forResource: "sunrise", withExtension: "jpg")
    
    let attach = try! UNNotificationAttachment(identifier: timerNotificationIdentifier, url: timerIconURL!, options: nil)
    
    content.attachments.append(attach)
    
    // send after 5 sec
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
    
    let notificationRequest = UNNotificationRequest(identifier: timerNotificationIdentifier, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(notificationRequest) { (error) in
      
          // when error happen
          if let error = error {
            print(error)
          }
          else {
            print("message was send...")
          }
      
        }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

