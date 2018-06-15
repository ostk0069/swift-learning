//
//  ViewController.swift
//  Swift4WunderList1
//
//  Created by Takuma Osada on 2018/06/13.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
  
  @IBOutlet var backImageView: UIImageView!
  @IBOutlet var backView: UIView!
  @IBOutlet var tableView: UITableView!
  @IBOutlet var textField: UITextField!
  
  // text of todo should input in this array
  var titleArray = [String]()
  var label: UILabel = UILabel()
  var count: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    textField.delegate = self
    
    backView.layer.cornerRadius = 2.0
    
    tableView.separatorStyle = .none
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    // get the db which is saved in app
    
    // title
    if UserDefaults.standard.object(forKey: "array") != nil {
      
      titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
      
    }
    
    // image
    if UserDefaults.standard.object(forKey: "image") != nil {
      
      let numberString = UserDefaults.standard.string(forKey: "image")
      
      backImageView.image = UIImage(named: numberString! + ".jpg")
      
    }
    
    tableView.reloadData()
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    // input the string in the array
    titleArray.append(textField.text!)
    
    // save the array in the app
    UserDefaults.standard.set(titleArray, forKey: "array")
    
    if UserDefaults.standard.object(forKey: "array") != nil {
    
      titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
      
      textField.text = ""
      tableView.reloadData()
      
    }
    
    // close the keyboard
    textField.resignFirstResponder()
    
    return true
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 107
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.layer.cornerRadius = 10.0
    label = cell.contentView.viewWithTag(1) as! UILabel
    label.text = titleArray[indexPath.row]
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return titleArray.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    // change the viewcontroller within amount
    count = Int(indexPath.row)
    
    performSegue(withIdentifier: "next", sender: nil)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "next" {
      
      let nextVC: NextViewController = segue.destination as! NextViewController
      
      nextVC.selectedNumber = count
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      
      // selected slide number should be title array number to be deleted
      
      titleArray.remove(at: indexPath.row)
      
      
      // save the array in the app
      UserDefaults.standard.set(titleArray, forKey: "array")
      
      tableView.reloadData()
      
    }
    else if editingStyle == .insert {
      
      
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

