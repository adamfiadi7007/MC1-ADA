//
//  ViewController.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 05/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    /// Data
    var utils = Utils()
    var arrOfMovie: [Movie] = []
    var storage = LocalStorage()
    
    
    //Outlet
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    @IBOutlet weak var movieTitleHome: UILabel!
    @IBOutlet weak var addText: UILabel!
    @IBOutlet weak var watchedText: UILabel!
    @IBOutlet weak var movieDescriptionText: UILabel!
    @IBOutlet weak var movieInfoYears: UILabel!
    @IBOutlet weak var movieRuntime: UILabel!
    
    
    // Data Control
    var booked: Bool = false
    var checklist: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        arrOfMovie = utils.retrieveData()
        
        
        
        arrOfMovie = storage.getMovies()
        if arrOfMovie.count == 0 {
            storage.saveMovies()
            arrOfMovie = storage.getMovies()
        }
        
        let datas = utils.getRecommendations(indexes:storage.getStorage(key:"userProfilingData"))
//        storage.updateStorage(indexes: [0,1,3], key:"userProfilingData")
        
        movieTitleHome.text = datas[0].movieTitle ?? ""
        movieInfoYears.text = utils.getYear(date:datas[0].movieInfoYear ?? "")
        movieRuntime.text = utils.parseRunTimeToString(date: datas[0].movieRuntime ?? "")
        movieDescriptionText.text = datas[0].movieDescription
        imageBackground.loadFrom(URLAddress: datas[0].movieImageUrl ?? "")
        
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

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}

