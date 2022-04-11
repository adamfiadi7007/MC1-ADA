//
//  TableViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 08/04/22.
//

import UIKit

class TableViewController: UITableViewController {

    var titles: [String] = ["satu", "dua", "tiga"]
    
    // Cell ID Initiation
    let homeCellId = "HomeTableViewCell"
    let movieDescs = [movieDesc]()
    
    @IBOutlet var HomeTableCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.isNavigationBarHidden = true
        tableView.rowHeight = view.frame.height
        
    
        //Registering Table View
        tableView.register(UINib.init(nibName: homeCellId, bundle: nil), forCellReuseIdentifier: homeCellId)
        tableView.separatorColor = UIColor.black
        
        //Init Data
        for _ in 1...3 {
            let movieDescss = movieDesc()
            movieDescss?.title = "TEST"
        }
        tableView.reloadData()
        
        
    }

    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieDescs.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellId, for: indexPath) as! HomeTableViewCell
        
        let movieDescss = movieDescs[indexPath.row]
        cell.movieTitle.text = movieDescss.title
        
//        cell.textLabel?.text = "Cell \(titles[indexPath.row])"
        
        return cell
    }

}
