//
//  ViewController.swift
//  delet
//
//  Created by Айсен Шишигин on 09/06/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let b1 = UIButton(frame: CGRect(x: 150, y: 200, width: 200, height: 20))

        b1.backgroundColor = .red

        b1.addTarget(self, action: #selector(b1Pressed), for: .touchUpInside)

        

         let b2 = UIButton(frame: CGRect(x: 150, y: 200, width: 200, height: 20))

        b2.backgroundColor = .green

         b2.addTarget(self, action: #selector(b2Pressed), for: .touchUpInside)

                

        b1.layer.zPosition = .infinity

        view.addSubview(b1)

         view.addSubview(b2)
        
        let title = UILabel()

        title.textColor = .black
    }

    @objc func b1Pressed() {
        print("red")
    }
    @objc func b2Pressed() {
        print("green")
    }
}

