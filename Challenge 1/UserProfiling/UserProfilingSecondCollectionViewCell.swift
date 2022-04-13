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
    
    func setup(with movie: Movie) {
        movieImageView.loadFrom(URLAddress: movie.movieImageUrl ?? "")
        movieTitleLbl.text = movie.movieTitle
    }
    
    func clicked(with movie: Movie) {
        print("Clicked")
        movieTitleLbl.textColor = UIColor(red: 0.3686, green: 0.3608, blue: 0.902, alpha: 1)
    }
}

