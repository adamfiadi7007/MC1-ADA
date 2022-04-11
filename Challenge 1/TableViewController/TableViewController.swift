//
//  TableViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 08/04/22.
//

import UIKit

class TableViewController: UITableViewController {

    var titles: [String] = ["satu", "dua", "tiga"]
    
    @IBOutlet var HomeTableCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.isNavigationBarHidden = true
        tableView.rowHeight = view.frame.height
        
    
    }

    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath)
        
        cell.textLabel?.text = "Cell \(titles[indexPath.row])"
        
        return cell
    }

}
