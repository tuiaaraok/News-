//
//  ViewController.swift
//  News
//
//  Created by Айсен Шишигин on 09/06/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var fullTextLabel: UILabel!
    
    var rssItem: Any!
    var currentImage: Any!
    //var item: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateText = (rssItem as AnyObject).object(forKey: "pubDate") as? String
        let endIndex = dateText!.index(dateText!.endIndex , offsetBy: -16)
        let truncated = dateText!.substring(to: endIndex)
        
        dateLabel.text = dateText
        titleLabel.text = (rssItem as AnyObject).object(forKey: "title") as? String
        fullTextLabel.text = (rssItem as AnyObject).object(forKey: "yandex:full-text") as? String
       
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        fullTextLabel.translatesAutoresizingMaskIntoConstraints = false
                
                 
        createConstraints()
        fetchImage()

    }
    
    
    func fetchImage() {
        let url = NSURL(string:currentImage as! String)
        let data = NSData(contentsOf:url! as URL)
        let image = UIImage(data:data! as Data)
    mainImage.image = image
        

    }
    func createConstraints() {
        
        mainImage.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: 100
            ).isActive = true
                  
        mainImage.heightAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: 1/4
            ).isActive = true

        mainImage.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
            ).isActive = true

        mainImage.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 15
            ).isActive = true
        
        
        
        
        titleLabel.topAnchor.constraint(
            equalTo: mainImage.bottomAnchor,
            constant: 15
            ).isActive = true
                         
        titleLabel.heightAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: 1/9
            ).isActive = true

        titleLabel.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
            ).isActive = true

        titleLabel.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 15
            ).isActive = true
        
        
        
        
        dateLabel.topAnchor.constraint(
            equalTo: titleLabel.bottomAnchor
            ).isActive = true
                                
        dateLabel.heightAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: 1/30
            ).isActive = true


        dateLabel.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 15
            ).isActive = true
               
        
        
        fullTextLabel.topAnchor.constraint(
            equalTo: dateLabel.bottomAnchor
            ).isActive = true
                                

        fullTextLabel.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
            ).isActive = true

        fullTextLabel.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 15
            ).isActive = true
               
        fullTextLabel.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -15
            ).isActive = true
        
        
    
}

}
