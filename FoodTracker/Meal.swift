//
//  File.swift
//  FoodTracker
//
//  Created by Nicolas MUGNIER on 07/02/2016.
//  Copyright © 2016 Nicolas MUGNIER. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    // MARK: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    //MARK: types
    struct Propertykey {
        
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
        
    }
    
    // MARK: initialyzation
    init?(name: String, photo: UIImage?, rating: Int){
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
        
    }
    
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder){
        
        aCoder.encodeObject(name, forKey: Propertykey.nameKey)
        aCoder.encodeObject(photo, forKey: Propertykey.photoKey)
        aCoder.encodeInteger(rating, forKey: Propertykey.ratingKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        
        let name = aDecoder.decodeObjectForKey(Propertykey.nameKey) as! String
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(Propertykey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(Propertykey.ratingKey)
        // Must call designated initilizer.
        self.init(name: name, photo: photo, rating: rating)
        
    }
    
}