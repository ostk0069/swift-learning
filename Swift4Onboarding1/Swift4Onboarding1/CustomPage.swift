//
//  CustomPage.swift
//  Swift4Onboarding1
//
//  Created by Takuma Osada on 2018/06/11.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import Foundation
import SwiftyOnboard

class CustomPage: SwiftyOnboardPage {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var subTitleLabel: UILabel!
  
  class func instanceFromNib() -> UIView {
    return UINib(nibName: "CustomPage", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
  }
  
}
