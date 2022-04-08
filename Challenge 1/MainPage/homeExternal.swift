//
//  homeExternal.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 07/04/22.
//

import Foundation
import UIKit

struct movieHome {
    
    func getMovie() -> [Movie] {
        return [Movie(movieTitle: "Twenty Five Twenty One", movieDescription: "In a time who dreams seem out of reach, a teen fencer pursues big ambitions and meets a hardworking young man who seeks to rebuild his life", movieBackgroundImage: UIImage(named: "bg-img-home"), movieInfoYear: "2022", movieInfoRating: "13+", movieInfoSeason: "Season 1"), Movie(movieTitle: "Spiderman", movieDescription: "Spiderman centers on student Peter Parker (Tobey Maguire) who, after being bitten by a genetically-altered spider, gains superhuman strength and the spider-like ability to cling to any surface.", movieBackgroundImage: UIImage(named: "10000-hours.png"), movieInfoYear: "2002", movieInfoRating: "PG13", movieInfoSeason: "3")]
    }
    
}
