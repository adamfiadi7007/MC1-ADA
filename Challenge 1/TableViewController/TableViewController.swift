//
//  TableViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 08/04/22.
//

import UIKit

class TableViewController: UITableViewController {

    let utils = Utils()
    
    
//    var titles: [String] = ["satu", "dua", "tiga"]
    
    // Cell ID Initiation
    let homeCellId = "HomeTableViewCell"
    var appearMovieDesc = [Movie]()
    var currentPage = 0
    
    @IBOutlet var HomeTableCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide Navigation & fixing the height of row
        navigationController?.isNavigationBarHidden = true
        tableView.rowHeight = view.frame.height
        
//        tableView.estimatedRowHeight = view.frame.height
        
    
        // Registering Table View
        tableView.register(UINib.init(nibName: homeCellId, bundle: nil), forCellReuseIdentifier: homeCellId)
//        tableView.separatorColor = UIColor.clear
        
        self.tableView.isPagingEnabled = true;
        
//        arrOfMovie = storage.getMovies()
//
//        if arrOfMovie.count == 0 {
//            storage.saveMovies()
//            arrOfMovie = storage.getMovies()
//        }
        
        let datas = utils.getRecommendations(indexes:[10,20,35])
//        storage.updateStorage(indexes: [0,1,3], key:"userProfilingData")
        
        // Init Data
        for movie in datas{
            var movieDescription = Movie()
            movieDescription.movieTitle = movie.movieTitle ?? ""
            movieDescription.movieImageUrl = movie.movieImageUrl ?? ""
            movieDescription.movieIndex = movie.movieIndex ?? -1
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
        cell.movieTitle.text = movieDescriptions.movieTitle
        cell.backgroundImage.loadFrom(URLAddress: movieDescriptions.movieImageUrl ?? "")
        cell.bookmarkButton.tag = movieDescriptions.movieIndex ?? -1
        return cell
    }
    
//    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//            let width = scrollView.frame.width
//            currentPage = Int(scrollView.contentOffset.x / width)
//        }

}
