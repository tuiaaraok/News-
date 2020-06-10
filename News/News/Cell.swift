//
//  Cell.swift
//  News
//
//  Created by Айсен Шишигин on 09/06/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           
           dateLabel.translatesAutoresizingMaskIntoConstraints = false
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
          
           
           createConstraints()
       }
    
    func createConstraints() {
        dateLabel.widthAnchor.constraint(
            equalTo: contentView.widthAnchor,
            multiplier: 1
            ).isActive = true
                  
        dateLabel.heightAnchor.constraint(
            equalTo: contentView.heightAnchor,
            multiplier: 1/7
            ).isActive = true

        dateLabel.centerYAnchor.constraint(
            equalTo: contentView.centerYAnchor,
            constant: -30
            ).isActive = true

        dateLabel.leftAnchor.constraint(
            equalTo: contentView.leftAnchor,
            constant: 15
            ).isActive = true
        
        
        
                     
           titleLabel.heightAnchor.constraint(
               equalTo: contentView.heightAnchor,
               multiplier: 7/4
               ).isActive = true

           titleLabel.centerYAnchor.constraint(
               equalTo: contentView.centerYAnchor,
               constant: 20
               ).isActive = true

           titleLabel.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor,
               constant: 12
               ).isActive = true
        
            titleLabel.leftAnchor.constraint(
                equalTo: contentView.leftAnchor,
                constant: 15
                ).isActive = true
        
            titleLabel.rightAnchor.constraint(
                equalTo: contentView.rightAnchor,
                constant: -15
                ).isActive = true
        
        
    }
}
