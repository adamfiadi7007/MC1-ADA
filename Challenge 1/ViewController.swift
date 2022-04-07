//
//  ViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 05/04/22.
//

import UIKit

struct Datas{
    var titleId: String?
    var releaseDate: String?
    var runtime: String?
    var title: String?
    var description: String?
    var genre: String?
    var imageUrl: String?
    var listImages: String?
    var actors: String?
    var starsActors: String?
    var directors: String?
    var streamingApp: String?
    var trailer: String?
}


class ViewController: UIViewController {
    
    //Utils
    let utils = Utils()
    
    //Homepage Variables
    var movieTitle: String = "Twenty Five Twenty One"
    var movieDescription: String = "In a time who dreams seem out of reach, a teen fencer pursues big ambitions and meets a hardworking young man who seeks to rebuild his lifess."
    var movieRuntime: String = "30 minutes"
    var movieReleaseYear: String = "2022"
    
    //Outlet
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    @IBOutlet weak var movieTitleHome: UILabel!
    @IBOutlet weak var addText: UILabel!
    @IBOutlet weak var watchedText: UILabel!
    @IBOutlet weak var movieDescriptionText: UILabel!
    @IBOutlet weak var movieRuntimeText: UILabel!
    
    @IBOutlet weak var movieReleaseYearText: UILabel!
    
    
    // Data Control
    var isBooked: Bool = false
    var isChecklist: Bool = false
    var indexData: Int = 0
    var data: [Datas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //retrieve csv
        data = utils.retrieve_data()
        movieTitle = data[indexData].title ?? ""
        movieDescription = data[indexData].description ?? ""
        movieRuntime = utils.parseDateToString(date: data[indexData].runtime ?? "")
        let movieReleaseDate = data[indexData].releaseDate?.split(separator: " ") ?? []
        movieReleaseYear = String(movieReleaseDate[2])
        
        movieTitleHome.text = movieTitle
        movieDescriptionText.text = movieDescription
        movieRuntimeText.text = movieRuntime
        movieReleaseYearText.text = movieReleaseYear
    }


    @IBAction func bookmarkButtonClick(_ sender: Any) {
        
        if isBooked {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle"), for: .normal)
            isBooked = false
        }else{
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle.fill"), for: .normal)
            isBooked = true
        }
    }
    
    @IBAction func checklistButtonClick(_ sender: Any) {
        
        if isChecklist {
            checklistButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            isChecklist = false
        }else{
            checklistButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            isChecklist = true
        }
        
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        indexData += 1
        movieTitle = data[indexData].title ?? ""
        movieDescription = data[indexData].description ?? ""
        movieRuntime = utils.parseDateToString(date: data[indexData].runtime ?? "")
        let movieReleaseDate = data[indexData].releaseDate?.split(separator: " ") ?? []
        movieReleaseYear = String(movieReleaseDate[2])
        
        movieTitleHome.text = movieTitle
        movieDescriptionText.text = movieDescription
        movieRuntimeText.text = movieRuntime
        movieReleaseYearText.text = movieReleaseYear
    }
    
}

