//
//  LocalStorage.swift
//  Challenge 1
//
//  Created by Jessica Geofanie on 12/04/22.
//

import Foundation

struct LocalStorage{
    
    let userDefault = UserDefaults.standard
    var utils = Utils()
    
    func set(data:Any, key:String) -> Bool{
        do{
            userDefault.set(data, forKey: key)
//            print(data)
        }catch{
            return false
        }
        return true
    }
    
    func get(key:String) -> String{
        do{
            let data = userDefault.string(forKey: key)
            return data ?? ""
        }catch{
            return ""
        }
    }
    
    func saveMovies() -> Bool{
        var arrofMovies = utils.retrieveData()
        
        let encoder = JSONEncoder()
        if let encodedMovieList = try? encoder.encode(arrofMovies) {
            self.set(data:encodedMovieList, key:"listMovies")
        }
        return true
    }
    
    func getMovies() -> [Movie]{
        if let savedMovies = userDefault.object(forKey: "listMovies") as? Data {
            let decoder = JSONDecoder()
            if let savedListMovies = try? decoder.decode([Movie].self, from: savedMovies) {
                print(savedListMovies[1])
                return savedListMovies
            }
        }
        return []
    }
}
