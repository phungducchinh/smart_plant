//
//  ViewControl.swift
//  ArduinoApp
//
//  Created by phungducchinh on 10/16/17.
//  Copyright © 2017 phungducchinh. All rights reserved.
//

import Foundation
import UIKit

class ViewControl: UIView {
    
    var light: Double = 50
    var water: Double = 50

    
    fileprivate var btnLighton : UIButton = {
        let btnLighton = UIButton()
        btnLighton.translatesAutoresizingMaskIntoConstraints = false
        btnLighton.layer.cornerRadius = 20
        btnLighton.backgroundColor = UIColor(red: 60/255, green: 150/255, blue: 0/255, alpha: 0.7)
        btnLighton.setTitleColor(.white, for: .normal)
//        btnLighton.setImage(UIImage(named: "lighton"), for: .normal)
  //      btnLighton.backgroundColor = .clear
//        btnLighton.backgroundImage(UIImage(named: "lighton"), for: .normal)
     //   btnLighton.setBackgroundImage(UIImage(named: "lighton"), for: .normal)
        btnLighton.setTitle("Mở đèn", for: .normal)
        btnLighton.addTarget(self, action: #selector(Lighton), for: .touchUpInside)
        
        return btnLighton
    }()
    
    fileprivate var btnLightoff : UIButton = {
        let btnLightoff = UIButton()
        btnLightoff.translatesAutoresizingMaskIntoConstraints = false
        btnLightoff.layer.cornerRadius = 20
        btnLightoff.backgroundColor = .orange
        btnLightoff.setTitleColor(.white, for: .normal)
        btnLightoff.backgroundColor = UIColor(red: 60/255, green: 150/255, blue: 0/255, alpha: 0.7)
        //btnLightoff.setImage(UIImage(named: "lightoff"), for: .normal)
        btnLightoff.setTitle("Tắt đèn", for: .normal)
        btnLightoff.addTarget(self, action: #selector(Lightoff), for: .touchUpInside)
        
        return btnLightoff
    }()
    
    fileprivate var btnWaterOn : UIButton = {
        let btnWaterOn = UIButton()
        btnWaterOn.translatesAutoresizingMaskIntoConstraints = false
        btnWaterOn.layer.cornerRadius = 20
        btnWaterOn.backgroundColor = .orange
        btnWaterOn.setTitleColor(.white, for: .normal)
        btnWaterOn.backgroundColor = UIColor(red: 60/255, green: 150/255, blue: 0/255, alpha: 0.7)
        //btnWaterOn.setImage(UIImage(named: "waterton"), for: .normal)
        btnWaterOn.setTitle("Mở tưới", for: .normal)
        btnWaterOn.addTarget(self, action: #selector(Wateron), for: .touchUpInside)
        
        return btnWaterOn
    }()
    
    fileprivate var btnWaterOff : UIButton = {
        let btnWaterOff = UIButton()
        btnWaterOff.translatesAutoresizingMaskIntoConstraints = false
        btnWaterOff.layer.cornerRadius = 20
        btnWaterOff.backgroundColor = .orange
        btnWaterOff.setTitleColor(.white, for: .normal)
        btnWaterOff.backgroundColor = UIColor(red: 60/255, green: 150/255, blue: 0/255, alpha: 0.7)
        //btnWaterOff.setImage(UIImage(named: "watertoff"), for: .normal)
        btnWaterOff.setTitle("Tắt tưới", for: .normal)
        btnWaterOff.addTarget(self, action: #selector(Wateroff), for: .touchUpInside)
        
        return btnWaterOff
    }()
    
    fileprivate var sldLight : UISlider = {
        let sldLight = UISlider()
        sldLight.translatesAutoresizingMaskIntoConstraints = false
        sldLight.addTarget(self, action: #selector(SlideLight), for: .valueChanged)
        return sldLight
    }()
    
    fileprivate var lblLight : UILabel = {
        let lblLight = UILabel()
        lblLight.translatesAutoresizingMaskIntoConstraints = false
        lblLight.textColor = .black
        return lblLight
    }()
    
    fileprivate var sldWater : UISlider = {
        let sldWater = UISlider()
        sldWater.translatesAutoresizingMaskIntoConstraints = false
        sldWater.addTarget(self, action: #selector(SlideWater), for: .valueChanged)
        return sldWater
    }()
    
    fileprivate var lblWater : UILabel = {
        let lblWater = UILabel()
        lblWater.translatesAutoresizingMaskIntoConstraints = false
        lblWater.textColor = .black
        return lblWater
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(btnLighton)
        self.addSubview(btnLightoff)
        self.addSubview(btnWaterOn)
        self.addSubview(btnWaterOff)
        self.addSubview(sldLight)
        self.addSubview(lblLight)
        self.addSubview(sldWater)
        self.addSubview(lblWater)

        sldLight.isContinuous = true
        sldWater.isContinuous = true
        
        sldLight.maximumValue = 100
        sldWater.maximumValue = 100
        
        sldLight.value = Float(light)
        sldWater.value = Float(water)
        lblLight.text = "\(String(format: "%.1f", light)) %"
        lblWater.text = "\(String(format: "%.1f", water)) %"
        
        //lblLight.text = "\(Int(sldLight.value)) %"
        //lblWater.text = "\(Int(sldWater.value)) %"
        
        let views = ["lighton" : self.btnLighton, "lightoff" : self.btnLightoff, "wateron" : self.btnWaterOn, "wateroff" : self.btnWaterOff, "sldlight" : self.sldLight, "lbllight" : self.lblLight, "sldwater" : self.sldWater, "lblwater" : self.lblWater] as [String : Any]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[lighton(40)]-30-[sldlight]-40-[wateron(40)]-30-[sldwater]", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[lightoff(40)]-30-[lbllight]", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[sldlight]-40-[wateroff(40)]-30-[lblwater]", options: [], metrics: nil, views: views))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[sldlight]-20-[lbllight(70)]-10-|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[sldwater]-20-[lblwater(70)]-10-|", options: [], metrics: nil, views: views))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[lighton(100)]", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[lightoff(100)]-10-|", options: [], metrics: nil, views: views))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[wateron(100)]", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[wateroff(100)]-10-|", options: [], metrics: nil, views: views))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc fileprivate func Lighton(){
        print("Light on")
    }
    @objc fileprivate func Lightoff(){
        print("Light off")
    }
    @objc fileprivate func Wateron(){
        print("Water on")
    }
    @objc fileprivate func Wateroff(){
        print("Water off")
    }
    
    @objc fileprivate func SlideLight(){
        print("Slide light")
        light = Double(sldLight.value)
        lblLight.text = "\(String(format: "%.1f", light)) %"
    }
    
    @objc fileprivate func SlideWater(){
        print("Slide Water")
        water = Double(sldWater.value)
        lblWater.text = "\(String(format: "%.1f", water)) %"
    }
}
