//
//  RetrieveCSV.swift
//  Challenge 1
//
//  Created by Jessica Geofanie on 07/04/22.
//

import Foundation
import TabularData

func retrieve_data() {
    let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")
    guard let fileUrl = Bundle.main.url(forResource: "movie_details", withExtension: "csv") else {return}
    
    var dataFrame = try! DataFrame(contentsOfCSVFile: fileUrl, options: options)
    
    print("\(dataFrame)")
}
