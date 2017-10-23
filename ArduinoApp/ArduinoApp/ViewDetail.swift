//
//  ViewDetail.swift
//  ArduinoApp
//
//  Created by phungducchinh on 10/16/17.
//  Copyright © 2017 phungducchinh. All rights reserved.
//

import Foundation
import UIKit

protocol ViewDetailDelegate: class {
    func didTapNextButton()
}

class ViewDetail : UIView {
    
    var delegate: ViewDetailDelegate?
    
    fileprivate let tbvDetail : TableDetail = {
        let tbvDetail = TableDetail()
        tbvDetail.translatesAutoresizingMaskIntoConstraints = false
        return tbvDetail
    }()
    
    fileprivate var btnConect : UIButton = {
        let btnConect = UIButton()
        btnConect.translatesAutoresizingMaskIntoConstraints = false
        btnConect.layer.cornerRadius = 20
       // btnConect.backgroundColor = .orange
        btnConect.setImage(UIImage(named: "la1"), for: .normal)
        btnConect.setTitleColor(.black, for: .normal)
        btnConect.setTitle("Kết nối", for: .normal)
        
        return btnConect
    }()
    
    fileprivate var btnControl : UIButton = {
        let btnControl = UIButton()
        btnControl.translatesAutoresizingMaskIntoConstraints = false
        btnControl.layer.cornerRadius = 20
        //btnControl.backgroundColor = .orange
        btnControl.setImage(UIImage(named: "la2"), for: .normal)
        btnControl.setTitleColor(.black, for: .normal)
        btnControl.setTitle("Điều khiển", for: .normal)
        
        return btnControl
    }()

    fileprivate var btnRefresh : UIButton = {
        let btnRefresh = UIButton()
        btnRefresh.translatesAutoresizingMaskIntoConstraints = false
        btnRefresh.layer.cornerRadius = 20
        //btnRefresh.backgroundColor = .orange
        btnRefresh.setImage(UIImage(named: "la3"), for: .normal)
        btnRefresh.setTitleColor(.black, for: .normal)
        btnRefresh.setTitle("Đo lại", for: .normal)
        
        return btnRefresh
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tbvDetail)
        self.addSubview(btnConect)
        self.addSubview(btnControl)
        self.addSubview(btnRefresh)
        self.tbvDetail.allowsSelection = false
        
        btnControl.addTarget(self, action: #selector(NextView), for: .touchUpInside)
        btnConect.addTarget(self, action: #selector(Connect), for: .touchUpInside)
        btnRefresh.addTarget(self, action: #selector(Refresh), for: .touchUpInside)
        
        let views = ["tbv" : self.tbvDetail, "conect" : self.btnConect, "control" : self.btnControl, "refresh" : self.btnRefresh] as [String : Any]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[tbv(300)]-20-[conect(50)]-20-[control(50)]-20-[refresh(50)]", options: [], metrics: nil, views: views))
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[conect(40)]-30-|", options: [], metrics: nil, views: views))
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[control(40)]-30-|", options: [], metrics: nil, views: views))
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[refresh(40)]-30-|", options: [], metrics: nil, views: views))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[tbv]-20-|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[control(140)]-20-|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[conect(140)]-20-|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[refresh(140)]-20-|", options: [], metrics: nil, views: views))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func NextView(){
        delegate?.didTapNextButton()
        print("dieu khien")
    }
    @objc fileprivate func Connect(){
        print("Ket noi")
    }
    @objc fileprivate func Refresh(){
        print("Do lai")
    }
}
