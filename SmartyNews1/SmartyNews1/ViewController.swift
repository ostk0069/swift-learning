//
//  ViewController.swift
//  SmartyNews1
//
//  Created by Takuma Osada on 2018/07/02.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var pageMenu: CAPSPageMenu?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    var controllerArray: [UIViewController] = []
    
    var controller1: News1ViewController = News1ViewController()
    controller1.title = "TOP"
    controllerArray.append(controller1)
    
    var controller2: News2ViewController = News2ViewController()
    controller2.title = "エンタメ"
    controllerArray.append(controller2)
    
    var controller3: News3ViewController = News3ViewController()
    controller3.title = "コスメ"
    controllerArray.append(controller3)
    
    var controller4: News4ViewController = News4ViewController()
    controller4.title = "スポーツ"
    controllerArray.append(controller4)
    
    var controller5: News5ViewController = News5ViewController()
    controller5.title = "グルメ"
    controllerArray.append(controller5)
    
    var parameters: [CAPSPageMenuOption] = [
      .menuItemSeparatorWidth(4.3),
      .useMenuLikeSegmentedControl(true),
      .menuItemSeparatorPercentageHeight(0.1)
    ]
    
    pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 20.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
    
    self.view.addSubview(pageMenu!.view)
    self.view.sendSubview(toBack: pageMenu!.view)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

