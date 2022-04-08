//
//  ViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 05/04/22.
//

import UIKit

struct Movie {
    var movieTitleId: String?
    var movieTitle: String?
    var movieDescription: String?
    var movieBackgroundImage: UIImage?
    var movieInfoYear: String?
    var movieInfoRating: String?
    var movieInfoSeason: String?
    
    var movieRuntime: String?
    var movieGenre: String?
    var moiveImageUrl: String?
    var movieListImages: String?
    var movieListActors: String?
    var movieStarsActors: String?
    var movieDirectors: String?
    var movieStreamingApp: String?
    var movieTrailer: String?
    var movieRatings: Double?
    var movieNumVotes: Int?
}


class ViewController: UIViewController {
    
    /// Data
    var getMovies = movieHome()
    var utils = Utils()
    var arrOfMovie: [Movie] = []
    
//    //Homepage Variables
//    var movieTitle: String = "Twenty Five Twenty One"
//    var movieDescription: String = "In a time who dreams seem out of reach, a teen fencer pursues big ambitions and meets a hardworking young man who seeks to rebuild his lifess."
    
    //Outlet
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    @IBOutlet weak var movieTitleHome: UILabel!
    @IBOutlet weak var addText: UILabel!
    @IBOutlet weak var watchedText: UILabel!
    @IBOutlet weak var movieDescriptionText: UILabel!
    @IBOutlet weak var movieInfoYears: UILabel!
    @IBOutlet weak var movieInfoRatings: UILabel!
    @IBOutlet weak var movieInfoSeasons: UILabel!
    
    
    // Data Control
    var booked: Bool = false
    var checklist: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        arrOfMovie = getMovies.getMovie()
        arrOfMovie = utils.retrieve_data()
        print(arrOfMovie)
        
        movieTitleHome.text = arrOfMovie[1].movieTitle
        movieInfoYears.text = arrOfMovie[1].movieInfoYear
        movieInfoRatings.text = arrOfMovie[1].movieInfoRating
        movieInfoSeasons.text = arrOfMovie[1].movieInfoSeason
        movieDescriptionText.text = arrOfMovie[1].movieDescription
        imageBackground.image = arrOfMovie[1].movieBackgroundImage
        
//        movieTitleHome.text = movieTitle
//        movieDescriptionText.text = movieDescription
    }


    @IBAction func bookmarkButtonClick(_ sender: Any) {
        
        if booked {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle"), for: .normal)
            booked = false
        }else{
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle.fill"), for: .normal)
            booked = true
        }
    }
    
    @IBAction func checklistButtonClick(_ sender: Any) {
        
        if checklist {
            checklistButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            checklist = false
        }else{
            checklistButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checklist = true
        }
        
    }
    
    
}

