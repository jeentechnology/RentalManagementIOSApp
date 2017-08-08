//
//  PropertyModel.swift
//  Rental Management
//
//  Created by mbeesley on 8/7/17.
//  Copyright © 2017 Jeen Technology. All rights reserved.
//

import Foundation
import UIKit
import os.log

class PropertyModel : NSObject, NSCoding {
    
    // MARK: Properties
    
    var id : Int
    var name : String
    var address : Address?
    var propDescription: String?
    var coverPhoto : UIImage?
    var isRented : Bool
    var rentalStart : Date?
    var rentalEnd : Date?
    var rentalPeriod : Int
    var rentalPdType : RentalPeriodType
    
    
    //MARK: Initialization
    
    init?(id : Int, name : String, address : Address?, propDescription : String?, coverPhoto : UIImage?, isRented : Bool, rentalStart : Date?, rentalEnd : Date?, rentalPeriod : Int, rentalPdType : RentalPeriodType) {
        
        // Validate Initialization
        
        // object must have an id > 0 and the name cannot be empty
        guard (!name.isEmpty) || (id < 0) else {
            os_log("The PropertyModel object must be initialized with a name", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.id = id
        self.name = name
        self.address = address
        self.propDescription = propDescription
        self.coverPhoto = coverPhoto
        self.isRented = isRented
        self.rentalStart = rentalStart
        self.rentalEnd = rentalEnd
        self.rentalPeriod = rentalPeriod
        self.rentalPdType = rentalPdType
    }
    
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: PropertyKey.id)
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(address, forKey: PropertyKey.address)
        aCoder.encode(propDescription, forKey: PropertyKey.propDescription)
        aCoder.encode(coverPhoto, forKey: PropertyKey.coverPhoto)
        aCoder.encode(isRented, forKey: PropertyKey.isRented)
        aCoder.encode(rentalStart, forKey: PropertyKey.rentalStart)
        aCoder.encode(rentalEnd, forKey: PropertyKey.rentalEnd)
        aCoder.encode(rentalPeriod, forKey: PropertyKey.rentalPeriod)
        aCoder.encode(rentalPdType, forKey: PropertyKey.rentalPdType)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Failed to decode id for property model object", log: OSLog.default, type: .debug)
            return nil
        }
        
        let id = aDecoder.decodeInteger(forKey: PropertyKey.id)
        let address = aDecoder.decodeObject(forKey: PropertyKey.address) as? Address
        let propDescription = aDecoder.decodeObject(forKey: PropertyKey.propDescription) as? String
        let coverPhoto = aDecoder.decodeObject(forKey: PropertyKey.coverPhoto) as? UIImage
        let isRented = aDecoder.decodeBool(forKey: PropertyKey.isRented)
        let rentalStart = aDecoder.decodeObject(forKey: PropertyKey.rentalStart) as? Date
        let rentalEnd = aDecoder.decodeObject(forKey: PropertyKey.rentalEnd) as? Date
        let rentalPeriod = aDecoder.decodeInteger(forKey: PropertyKey.rentalPeriod)
        let rentalPdType = aDecoder.decodeObject(forKey: PropertyKey.rentalPdType) as! RentalPeriodType
        
        self.init(id: id, name: name, address: address, propDescription: propDescription, coverPhoto: coverPhoto, isRented: isRented, rentalStart: rentalStart, rentalEnd: rentalEnd, rentalPeriod: rentalPeriod, rentalPdType: rentalPdType)
    }
    
    
    
    //MARK: Types
    
    enum PropertyType {
        case PerriodicRental
        case Vacation
    }
    
    enum RentalPeriodType {
        case Year
        case Month
        case Week
        case Day
    }
    
    struct PropertyKey {
        static let id = "id"
        static let name = "name"
        static let address = "address"
        static let propDescription = "propDescription"
        static let coverPhoto = "coverPhoto"
        static let isRented = "isRented"
        static let rentalStart = "rentalStart"
        static let rentalEnd = "rentalEnd"
        static let rentalPeriod = "rentalPeriod"
        static let rentalPdType = "rentalPdType"
    }
    
}
