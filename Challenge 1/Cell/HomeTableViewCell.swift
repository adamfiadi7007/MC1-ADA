//
//  HomeTableViewCell.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 11/04/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    
    var booked: Bool = false
    var checklist: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
