//
//  Movies.swift
//  Challenge 1
//
//  Created by zy on 08/04/22.
//

import Foundation
import UIKit

struct Movie:Codable{
    var movieIndex: Int?
    var movieTitleId: String?
    var movieTitle: String?
    var movieDescription: String?
    var movieInfoYear: String?
    var movieInfoRating: String?
    var movieInfoSeason: String?
    var movieRuntime: String?
    var movieGenre: String?
    var movieImageUrl: String?
    var movieListImages: [String]?
    var movieListActors: [Actor]?
    var movieStarsActors: String?
    var movieDirectors: String?
    var movieStreamingApp: String?
    var movieTrailer: String?
    var movieRatings: Double?
    var movieNumVotes: Int?
    

    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.movieTitleId == rhs.movieTitleId
    }
}
