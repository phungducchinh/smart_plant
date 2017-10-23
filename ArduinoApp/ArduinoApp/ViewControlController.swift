//
//  ViewControlController.swift
//  ArduinoApp
//
//  Created by phungducchinh on 10/16/17.
//  Copyright © 2017 phungducchinh. All rights reserved.
//

import Foundation
import UIKit

class ViewControlController: UIViewController {
    
    let viewControl = ViewControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.viewControl
        navigationItem.title = "Điều khiển"
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "a")!)
        //self.navigationController?.navigationBar.topItem?.title = ""
    }
    
}


