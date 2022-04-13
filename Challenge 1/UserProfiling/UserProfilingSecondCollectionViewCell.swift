//
//  UserProfilingSecondCollectionViewCell.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 13/04/22.
//

import UIKit

class UserProfilingSecondCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var storage = LocalStorage()
    
    func setup(with movie: Movie) {
        movieImageView.loadFrom(URLAddress: movie.movieImageUrl ?? "")
        movieTitleLbl.text = movie.movieTitle
    }
}

