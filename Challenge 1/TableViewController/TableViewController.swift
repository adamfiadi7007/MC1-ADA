//
//  TableViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 08/04/22.
//

import UIKit

class TableViewController: UITableViewController {

//    var titles: [String] = ["satu", "dua", "tiga"]
    
    // Cell ID Initiation
    let homeCellId = "HomeTableViewCell"
    var appearMovieDesc = [movieDesc]()
    
    @IBOutlet var HomeTableCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide Navigation & fixing the height of row
        navigationController?.isNavigationBarHidden = true
        tableView.rowHeight = view.frame.height
        
    
        // Registering Table View
        tableView.register(UINib.init(nibName: homeCellId, bundle: nil), forCellReuseIdentifier: homeCellId)
        tableView.separatorColor = UIColor.black
        
        // Init Data
        for _ in 1...5 {
            var movieDescription = movieDesc()
            movieDescription.title = "Test Title"
            appearMovieDesc.append(movieDescription)
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appearMovieDesc.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellId, for: indexPath) as! HomeTableViewCell
        
        let movieDescriptions = appearMovieDesc[indexPath.row]
        cell.movieTitle.text = movieDescriptions.title
                
        return cell
    }

}
