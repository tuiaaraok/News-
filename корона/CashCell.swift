//
//  CashCell.swift
//  корона
//
//  Created by Айсен Шишигин on 08/05/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class CashCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var cashCode: UILabel!
    @IBOutlet var value: UILabel!
    @IBOutlet var previous: UILabel!
    
    
    func configure(with course: Money ) {
        name.text = course.Name ?? ""
     //   cashCode.text = course.Valute ?? ""
//        value.text = "\(String(describing: course.Value))"
//        previous.text = "\(String(describing: course.Previous))"
//
       
//       DispatchQueue.global().async {  //выходим в глобальный фон чтобы при открытии картинки загружались последовательно
//            guard let imageUrl = URL(string: course.imageUrl!) else {return}
//              guard let imageData = try?Data(contentsOf: imageUrl) else {return}
//              
//              DispatchQueue.main.async {
//                  self.imageCell.image = UIImage(data: imageData)
//       }
//      
//       }
       
       }
    
    
    

}
