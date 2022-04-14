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
    
    var booked: Bool = false
    var checklist: Bool = false
    
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

        
    }
    
    @IBAction func handleWatchedButton(_ sender: UIButton) {
        if checklist {
            checklistButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            checklist = false
            WatchedLabel.text="Watched?"
            storage.removeWatchList(index: sender.tag, key: "userWatchedData")
            print(storage.getStorage(key: "userWatchedData"))
        }else{
            checklistButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checklist = true
            WatchedLabel.text="Watched"
            storage.updateStorage(indexes: [sender.tag], key: "userWatchedData")
            print(storage.getStorage(key: "userWatchedData"))
        }
    }
    @IBAction func handleBookmarkButton(_ sender: UIButton) {
        if booked {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle"), for: .normal)
            booked = false
            WatchlistLabel.text="Add"
            storage.removeWatchList(index: sender.tag, key: "userWatchlistData")
            print(storage.getStorage(key: "userWatchlistData"))
        }else{
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle.fill"), for: .normal)
            booked = true
            WatchlistLabel.text="Added"
            storage.updateStorage(indexes: [sender.tag], key: "userWatchlistData")
            print(storage.getStorage(key: "userWatchlistData"))
        }
    }
}
