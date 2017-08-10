//
//  Address.swift
//  Rental Management
//
//  Created by mbeesley on 8/7/17.
//  Copyright © 2017 Jeen Technology. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Address {
    
    //MARK: Properties
    
    var address1 : String
    var address2 : String?
    var city : String
    var state : String
    var postalCode : String
    var country : String
    
    
    //MARK: Initailization
    init?(address1 : String, address2 : String?, city : String, state : String, postalCode : String, country : String) {
        
        guard !address1.isEmpty && !city.isEmpty && !state.isEmpty && !postalCode.isEmpty && !country.isEmpty else {
            os_log("You must submit a complete address, including address1, city, state, postal code and country", log: OSLog.default, type: .debug)
            return nil
        }
        
        
        self.address1 = address1
        self.address2 = address2
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }
}
