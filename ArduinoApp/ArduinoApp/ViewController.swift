//
//  ViewController.swift
//  ArduinoApp
//
//  Created by phungducchinh on 10/16/17.
//  Copyright © 2017 phungducchinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewdetail = ViewDetail()
    //let viewdetail = ViewControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.viewdetail
        viewdetail.delegate = self
        self.navigationController?.navigationBar.topItem?.title =  "SMART PLANT"
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "a")!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : ViewDetailDelegate {
    func didTapNextButton() {
        self.navigationController?.pushViewController(ViewControlController(), animated: true)
    }
}
