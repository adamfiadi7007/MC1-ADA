//
//  watchListViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 07/04/22.
//

import UIKit

class WatchListViewController: UIViewController {
    
    let storage = LocalStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storage.saveMovies()
        let watchlistIndexes = storage.getStorage(key: "userWatchlistData")
        let movies = storage.getMovies()
        for (idx,movie) in movies.enumerated() {
            var watchlistMovie = Movie()
            if watchlistIndexes.contains(idx){
                watchlistMovie.movieImageUrl = movie.movieImageUrl
                watchlistMovie.movieTitle = movie.movieTitle
                watchlistMovie.movieStreamingApp = movie.movieStreamingApp
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
