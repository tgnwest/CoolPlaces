//
//  PlaceModel.swift
//  CoolPlaces
//
//  Created by Alex Tregubov on 21.04.2020.
//  Copyright © 2020 Alex Tregubov. All rights reserved.
//

import UIKit

struct Place {
    var name: String
    var location: String?
    var type: String?
    var placeImage: String?
    var image: UIImage?
    
    static let placeNames = ["Bonsai", "Burger Heroes", "Kitchen", "Love&Life", "Morris Pub", "Sherlock Holmes", "Speak Easy", "X.O"]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in placeNames {
            places.append(Place(name: place, location: "Rostov", type: "Rest", placeImage: place, image: nil))
        }
        
        return places
    }
}
