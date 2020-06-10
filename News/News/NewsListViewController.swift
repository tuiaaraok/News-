//
//  NewsListViewController.swift
//  News
//
//  Created by Айсен Шишигин on 09/06/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class NewsListViewController: UITableViewController, XMLParserDelegate {

    var rssItems : NSArray = []
    var feedImgs: [AnyObject] = []
    var url: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 100
        self.tableView.dataSource = self
        self.tableView.delegate = self
        

        loadData()
    }



    func loadData() {
        url = URL(string: "https://www.vesti.ru/vesti.rss")!
        loadRss(url);
    }

    func loadRss(_ data: URL) {

        // XmlParserManager instance/object/variable.
        let myParser : ParserManager = ParserManager().initWithURL(data) as! ParserManager

        // Put feed in array.
        feedImgs = myParser.img as [AnyObject]
        rssItems = myParser.feeds
        print(feedImgs)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



    // MARK: - Table view data source.
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rssItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! Cell
       

        
        cell.titleLabel?.text = (rssItems.object(at: indexPath.row) as AnyObject).object(forKey: "title") as? String
        cell.titleLabel?.numberOfLines = 0
        cell.titleLabel?.lineBreakMode = .byWordWrapping
        
        
        let dateText = (rssItems.object(at: indexPath.row) as AnyObject).object(forKey: "pubDate") as? String
        let endIndex = dateText!.index(dateText!.endIndex , offsetBy: -16)
        let truncated = dateText!.substring(to: endIndex)
        cell.dateLabel.text = truncated

        return cell
    }
    
    
    
        // MARK: - Navigation
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailViewController
                detailVC.rssItem = rssItems[indexPath.item]
                detailVC.currentImage = feedImgs[indexPath.row]
            }
        }
    
}
    
