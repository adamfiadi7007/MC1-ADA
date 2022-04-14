//
//  TableViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 08/04/22.
//

import UIKit

class TableViewController: UIViewController {

    let utils = Utils()
    
    // Cell ID Initiation
    let homeCellId = "HomeTableViewCell"
    var appearMovieDesc = [Movie]()
    var currentPage = 0
    var storage = LocalStorage()
    
    @IBOutlet var HomeTableCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide Navigation & fixing the height of row
        navigationController?.isNavigationBarHidden = true
        HomeTableCell.rowHeight = view.frame.height
        
        // Registering Table View
        HomeTableCell.register(UINib.init(nibName: homeCellId, bundle: nil), forCellReuseIdentifier: homeCellId)
        
        self.HomeTableCell.isPagingEnabled = true;
        self.HomeTableCell.tableHeaderView = nil;
        
        let datas = utils.getRecommendations(indexes: storage.getStorage(key: "userProfilingData"))
        
        // Init Data
        for movie in datas{
            var movieDescription = Movie()
            movieDescription.movieTitle = movie.movieTitle ?? ""
            movieDescription.movieImageUrl = movie.movieImageUrl ?? ""
            movieDescription.movieIndex = movie.movieIndex ?? -1
            appearMovieDesc.append(movieDescription)
        }
        HomeTableCell.reloadData()
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appearMovieDesc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellId, for: indexPath) as! HomeTableViewCell
        cell.currentCell = indexPath.row
        cell.collectionView.reloadData()
        return cell
    }
}
