//
//  NextViewController.swift
//  SwiftButton1
//
//  Created by Takuma Osada on 2018/06/03.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var changeLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    @IBAction func Change(_ sender: Any) {
      
      changeLabel.text = "鍵がかかりました"
      
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
