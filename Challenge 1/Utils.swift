//
//  Utils.swift
//  Challenge 1
//
//  Created by Jessica Geofanie on 07/04/22.
//

import Foundation
import TabularData

struct Utils{
    func retrieve_data() -> [Datas]{
        
        var arrOfDatas : [Datas] = []
        
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
            let listImages = row["list_images"] ?? ""
            let actors = row["actors"] ?? ""
            let starsActors = row["stars_actors"] ?? ""
            let directors = row["directors"] ?? ""
            let streamingApp = row["Streaming App"] ?? ""
            let trailer = row["Trailer"] ?? ""

            let data = Datas(titleId: (titleId as! String), releaseDate: releaseDate as? String , runtime: runtime as! String, title: title as! String, description: description as! String, genre: genre as! String, imageUrl: imageUrl as! String, listImages: listImages as! String, actors: actors as! String, starsActors: starsActors as! String, directors: directors as! String, streamingApp: streamingApp as! String, trailer: trailer as? String)
            
            arrOfDatas.append(data)
        }
        return arrOfDatas
    }
}
