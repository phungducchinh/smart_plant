//
//  TableDetail.swift
//  ArduinoApp
//
//  Created by phungducchinh on 10/16/17.
//  Copyright © 2017 phungducchinh. All rights reserved.
//

import Foundation
import UIKit

class TableDetail: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
        self.register(CellDetail.self, forCellReuseIdentifier: "CellDetail")
        self.backgroundColor = .clear
        self.isScrollEnabled = false
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableDetail: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDetail") as! CellDetail
        if indexPath.row == 0 {
            cell.detail = "Nhiệt độ"
            cell.info = "32 độ C"
        }else if indexPath.row == 1 {
            cell.detail = "Độ ẩm không khí"
            cell.info = "70%"
        }else if indexPath.row == 2 {
            cell.detail = "Độ ẩm đất"
            cell.info = "30%"
        }else if indexPath.row == 3 {
            cell.detail = "Mưa"
            cell.info = "Mưa nhỏ"
        }else if indexPath.row == 4 {
            cell.detail = "Sáng/tối"
            cell.info = "Sáng"
        }
        return cell
    }
}
