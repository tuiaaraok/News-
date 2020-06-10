//
//  MainTableViewController.swift
//  корона
//
//  Created by Айсен Шишигин on 08/05/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
  private let jsonUrlOne = "https://www.cbr-xml-daily.ru/daily_json.js"
   

    // MARK: - Table view data source
    private var cashes: [Money] = []
    private var valute: [Cash] = []

    
    override func viewDidLoad() {
              super.viewDidLoad()
              fetchData()
          }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cashes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CashCell
        let money = cashes[indexPath.row]
        cell.configure(with: money)

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              return 100
          }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func fetchData() {
        guard let url = URL(string: jsonUrlOne) else {print("error"); return}
                              
                              URLSession.shared.dataTask(with: url) { (data, _, _) in
                                  
                                  guard let data = data else {return}
                                  
                                  do {
                                   self.valute = try JSONDecoder().decode([Cash].self, from: data)
                   
                              
                                  } catch let error {
                                      print(error)
                                  }
                              }.resume()
                 }
}
