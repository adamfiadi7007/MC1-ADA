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
                return savedListMovies
            }
        }
        return []
    }
    
    //simpen index movie yang disukai user
    
    func setStorage(indexes:[Int], key:String) -> Bool{
        let encoder = JSONEncoder()
        if let indexList = try? encoder.encode(indexes) {
//            self.set(data:indexList, key:"userProfilingData")
            self.set(data:indexList, key:key)
        }
        return true
    }
    
    func getStorage(key:String) -> [Int]{
//        if let indexList = userDefault.object(forKey: "userProfilingData") as? Data {
        if let indexList = userDefault.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let indexListProfiling = try? decoder.decode([Int].self, from: indexList) {
                return indexListProfiling
            }
        }
        return []
    }
    
    func updateStorage(indexes:[Int],key:String) -> Bool{
        var allIndexes:[Int] = self.getStorage(key:key)
        
        allIndexes+=indexes
        
        self.setStorage(indexes: allIndexes.removingDuplicates(),key:key)
        return true
    }
    
    func removeWatchList(index: Int, key:String) -> Bool{
        var indexes:[Int] = self.getStorage(key: key)
        
        indexes.removeEqualItems(index)
        self.setStorage(indexes: indexes, key: key)
        return true
    }
    
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension Array where Element: Equatable {
  
  mutating func removeEqualItems(_ item: Element) {
    self = self.filter { (currentItem: Element) -> Bool in
      return currentItem != item
    }
  }

  mutating func removeFirstEqualItem(_ item: Element) {
    guard var currentItem = self.first else { return }
    var index = 0
    while currentItem != item {
      index += 1
      currentItem = self[index]
    }
    self.remove(at: index)
  }
  
}
  
