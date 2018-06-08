//
//  ViewController.swift
//  Swift4TodoApp1
//
//  Created by Takuma Osada on 2018/06/06.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet var tableView: UITableView!
  
  var resultArray = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    
    tableView.dataSource = self
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // take out the array which is saved
    
    if UserDefaults.standard.object(forKey: "array") != nil {
      
      resultArray = UserDefaults.standard.object(forKey: "array") as! [String]
      
    }
    
    tableView.reloadData()
    
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return resultArray.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // related to cell
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
    
    cell.textLabel?.text = resultArray[indexPath.row]
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      
      // the numbe of cell which is slided should delete
      resultArray.remove(at: indexPath.row)
      
      // save that array again in the app
      UserDefaults.standard.set(resultArray, forKey: "array")
      
      // reload tableView
      tableView.reloadData()
      
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

