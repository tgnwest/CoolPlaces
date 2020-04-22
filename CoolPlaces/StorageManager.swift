//
//  StorageManager.swift
//  CoolPlaces
//
//  Created by Alex Tregubov on 22.04.2020.
//  Copyright © 2020 Alex Tregubov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
    
}
