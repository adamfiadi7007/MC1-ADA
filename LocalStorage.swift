//
//  LocalStorage.swift
//  Challenge 1
//
//  Created by Jessica Geofanie on 12/04/22.
//

import Foundation

struct LocalStorage{
    
    let userDefault = UserDefaults.standard
    
    func set(data:String, key:String) -> Bool{
        do{
            userDefault.set(data, forKey: key)
            print(data)
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
    
    
}
