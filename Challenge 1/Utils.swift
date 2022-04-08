//
//  Utils.swift
//  Challenge 1
//
//  Created by Jessica Geofanie on 07/04/22.
//
import Foundation
import TabularData

struct Utils{
    func retrieveData() -> [Movie]{
        
        var arrOfDatas : [Movie] = []
        
        let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")
        guard let fileUrl = Bundle.main.url(forResource: "movie_details", withExtension: "csv") else{ return [] }
        let dataFrame = try! DataFrame(contentsOfCSVFile: fileUrl, options: options)
        
        
        for row in dataFrame.rows{
            let titleId = row["title_id"] ?? ""
            let releaseDate = row["release_date"] ?? ""
            let runtime = row["runtime"] ?? ""
            let title = row["title"] ?? ""
            let description = row["description"] ?? ""
            let genre = row["genre"] ?? ""
            let imageUrl = row["image_url"] ?? ""
            let rawListImages = row["list_images"] as? String
            let listImages: [String] = try! JSONDecoder().decode([String].self, from: rawListImages!.data(using: .utf8)!)
            let rawActors = row["actors"] as? String
            let actors: [Actor] = try! JSONDecoder().decode([Actor].self, from: rawActors!.data(using: .utf8)!)
            let starsActors = row["stars_actors"] ?? ""
            let directors = row["directors"] ?? ""
            let streamingApp = row["streaming_app"] ?? ""
            let trailer = row["trailer"] ?? ""
            let ratings = row["average_ratings"] ?? ""
            let numVotes = row["num_votes"] ?? ""
            
            let data = Movie(movieTitleId: (titleId as! String) , movieTitle: (title as! String) , movieDescription: description as! String, movieInfoYear: releaseDate as! String, movieInfoRating: releaseDate as! String, movieInfoSeason: releaseDate as! String, movieRuntime: runtime as! String, movieGenre: genre as! String, moiveImageUrl: imageUrl as! String, movieListImages: listImages as! [String], movieListActors: actors , movieStarsActors: starsActors as! String, movieDirectors: directors as! String, movieStreamingApp: streamingApp as! String, movieTrailer: trailer as! String, movieRatings: ratings as? Double, movieNumVotes: (numVotes as! Int))
            
            //            print(data)
            arrOfDatas.append(data)
            
        }
        return arrOfDatas
    }
    
    func parseRunTimeToString(date: String) -> String{
        return date.replacingOccurrences(of: " hours", with: "h").replacingOccurrences(of: " hour", with: "h").replacingOccurrences(of: " minutes", with: "m").replacingOccurrences(of: " minute", with: "m")
    }
    
    func getYear(date: String) -> String{
        return String(date.split(separator: " ")[2])
    }
}