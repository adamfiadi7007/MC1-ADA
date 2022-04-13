//
//  UserProfilingSecondCollectionViewCell.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 13/04/22.
//

import UIKit

class UserProfilingSecondCollectionViewCell: UICollectionViewCell {
    
    var isClicked = false
    var storage = LocalStorage()
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func setup(with movie: Movie) {
        movieImageView.loadFrom(URLAddress: movie.movieImageUrl ?? "")
        movieTitleLbl.text = movie.movieTitle
    }
    
    func clicked(with movie: Movie) {
        if isClicked == false {
            movieTitleLbl.textColor = UIColor(red: 0.3686, green: 0.3608, blue: 0.902, alpha: 1)
            isClicked = true
            storage.updateStorage(indexes: [movie.movieIndex ?? -1], key: "userProfilingData")
        } else {
            movieTitleLbl.textColor = UIColor.white
            isClicked = false
            storage.removeWatchList(index: movie.movieIndex ?? -1, key: "userProfilingData")
        }
        
    }
}

