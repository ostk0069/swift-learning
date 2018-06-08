//
//  AddViewController.swift
//  Swift4TodoApp1
//
//  Created by Takuma Osada on 2018/06/08.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

  @IBOutlet var textField: UITextField!
  
  var array = [String]()
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func add(_ sender: Any) {
    
    // see what array has right now
    if UserDefaults.standard.object(forKey: "array") != nil {
      
      UserDefaults.standard.object(forKey: "array") as! [String]
      
    }
    
    //text(array) that are input in textfield should be saved
    
    array.append(textField.text!)
    
    UserDefaults.standard.set(array, forKey: "array")
    
    // go back
    
    self.navigationController?.popViewController(animated: true)
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
