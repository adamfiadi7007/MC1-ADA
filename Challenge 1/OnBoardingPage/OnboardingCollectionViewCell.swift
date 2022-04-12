//
//  OnboardingCollectionViewCell.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 12/04/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    
    func setup(_ slide: OnboardingSlide) {
            slideImageView.image = slide.image
            slideTitleLbl.text = slide.title
            slideDescriptionLbl.text = slide.description
        }
}
