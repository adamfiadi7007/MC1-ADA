//
//  UserProfilingCollectionViewCell.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 13/04/22.
//

import UIKit

class UserProfilingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func setup(with movies: UserProfilingMovie) {
        movieImageView.image = movies.image
        movieTitleLbl.text = movies.title
    }
}
