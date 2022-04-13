//
//  FirstMovDescCollectionViewCell.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 13/04/22.
//

import UIKit

class FirstMovDescCollectionViewCell: UICollectionViewCell {

    let utils = Utils()
    
    var appearMovieDesc = [Movie]()
    var storage = LocalStorage()
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    //button
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    
    //label
    @IBOutlet weak var WatchlistLabel: UILabel!
    @IBOutlet weak var WatchedLabel: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRuntime: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        
        backgroundImage.image = UIImage(named: "10000-hours.png")
        
        let datas = utils.getRecommendations(indexes: storage.getStorage(key: "userProfilingData"))
        
        // Init Data
//        for movie in datas{
//            var movieDescription = Movie()
//            movieDescription.movieTitle = movie.movieTitle ?? ""
//            movieDescription.movieImageUrl = movie.movieImageUrl ?? ""
//            movieDescription.movieIndex = movie.movieIndex ?? -1
//            appearMovieDesc.append(movieDescription)
//        }
        
    }
    
    override func

}
