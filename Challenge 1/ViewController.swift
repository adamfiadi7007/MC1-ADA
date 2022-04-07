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
    
    //Outlet
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    @IBOutlet weak var movieTitleHome: UILabel!
    @IBOutlet weak var addText: UILabel!
    @IBOutlet weak var watchedText: UILabel!
    @IBOutlet weak var movieDescriptionText: UILabel!
    
    // Data Control
    var booked: Bool = false
    var checklist: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //retrieve csv
        utils.retrieve_data()
        
        // Do any additional setup after loading the view.
        
        movieTitleHome.text = movieTitle
        movieDescriptionText.text = movieDescription
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

