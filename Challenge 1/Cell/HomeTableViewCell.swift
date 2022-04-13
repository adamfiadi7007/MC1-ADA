//
//  HomeTableViewCell.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 11/04/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    var storage = LocalStorage()
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    //button
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    
    //label
    @IBOutlet weak var WatchlistLabel: UILabel!
    @IBOutlet weak var WatchedLabel: UILabel!
    
    var booked: Bool = false
    var checklist: Bool = false
    
    //add target
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func bookmarkButtonClick(_ sender: UIButton) {
        if booked {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle"), for: .normal)
            booked = false
            WatchlistLabel.text="Add"
            storage.removeWatchList(index: sender.tag, key: "userWatchlistData")
//            print("remove watchlist")
            print(storage.getStorage(key: "userWatchlistData"))
        }else{
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle.fill"), for: .normal)
            booked = true
            WatchlistLabel.text="Added"
            storage.updateStorage(indexes: [sender.tag], key: "userWatchlistData")
//            print("add watchlist")
            print(storage.getStorage(key: "userWatchlistData"))
        }
    }
    
    @IBAction func checklistButtonClick(_ sender: UIButton) {
        
        if checklist {
            checklistButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            checklist = false
            WatchedLabel.text="Watched?"
            storage.removeWatchList(index: sender.tag, key: "userWatchedData")
//            print("remove watched")
            print(storage.getStorage(key: "userWatchedData"))
        }else{
            checklistButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checklist = true
            WatchedLabel.text="Watched"
            storage.updateStorage(indexes: [sender.tag], key: "userWatchedData")
//            print("add watched")
            print(storage.getStorage(key: "userWatchedData"))
        }
    }
    
}
