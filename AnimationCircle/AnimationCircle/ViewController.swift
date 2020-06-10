//
//  ViewController.swift
//  AnimationCircle
//
//  Created by Айсен Шишигин on 09/06/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let coutingLabel : CountingLabel = {
        let label = CountingLabel()
        label.text = "0%"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
        return label
    }()
    
 let shapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLanel()
        
        let trackLayer = CAShapeLayer()
        let center = view.center
       
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi/2, clockwise: true)
        
        
        
        trackLayer.path = circularPath.cgPath
        trackLayer.lineWidth = 20
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackLayer)
        
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 20
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    @objc func handleTap() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnim")
        
        coutingLabel.count(from: 0, to: 100, withDuration: 2, andAnimation: .linear, andCounterType: .intType)
        
    }
    
    private func setupLanel() {
        view.addSubview(coutingLabel)
        coutingLabel.translatesAutoresizingMaskIntoConstraints = false
        coutingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        coutingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        coutingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        coutingLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
         
    }


}

