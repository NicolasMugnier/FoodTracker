//
//  File.swift
//  FoodTracker
//
//  Created by Nicolas MUGNIER on 07/02/2016.
//  Copyright © 2016 Nicolas MUGNIER. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: initialyzation
    init?(name: String, photo: UIImage?, rating: Int){
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
        
    }
    
}