//
//  CellDetail.swift
//  ArduinoApp
//
//  Created by phungducchinh on 10/16/17.
//  Copyright © 2017 phungducchinh. All rights reserved.
//

import Foundation
import UIKit

class CellDetail: UITableViewCell {
    
    fileprivate let lblDetail : UILabel = {
        let lblDetail = UILabel()
        lblDetail.translatesAutoresizingMaskIntoConstraints = false
        lblDetail.textColor = .black
        lblDetail.backgroundColor = .clear
        return lblDetail
    }()
    
    public var detail : String?{
        didSet{
            lblDetail.text = detail
        }
    }
    
    fileprivate let lblInfo : UILabel = {
        let lblInfo = UILabel()
        lblInfo.translatesAutoresizingMaskIntoConstraints = false
        lblInfo.textColor = .black
        return lblInfo
    }()
    
    public var info : String?{
        didSet{
            lblInfo.text = info
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(lblDetail)
        contentView.addSubview(lblInfo)
        self.backgroundColor = .clear
        
        let views = ["detail" : self.lblDetail, "info" : self.lblInfo]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[detail]-20-[info]-5-|", options: [], metrics: nil, views: views))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[detail]-5-|", options: [], metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[info]-5-|", options: [], metrics: nil, views: views))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
