//
//  Rental_ManagementTests.swift
//  Rental ManagementTests
//
//  Created by mbeesley on 8/5/17.
//  Copyright © 2017 Jeen Technology. All rights reserved.
//

import XCTest
@testable import Rental_Management

class Rental_ManagementTests: XCTestCase {
    
    /*
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
     
     func testPerformanceExample() {
     // This is an example of a performance test case.
     self.measure {
     // Put the code you want to measure the time of here.
     }
     }
    */
    
    func testPropertyModelSuccessfulInit() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dateHelper = DateFormatter()
        dateHelper.dateFormat = "yyyy/MM/dd"
        
        // test that you can init a property model with valid id and name and optionals set to nil
        let normalPropertyModel = PropertyModel.init(id: 1, name: "Test Property", address: nil, propDescription: "Test prop description", coverPhoto: nil, isRented: false, rentalStart: nil, rentalEnd: nil, rentalPeriod: 0, rentalPdType: .Month)
        XCTAssertNotNil(normalPropertyModel)
        
        
        // test that a full initialization works
        let rentalStart = dateHelper.date(from: "2017/01/01")
        let rentalEnd = dateHelper.date(from: "2017/12/31")
        let address = Address.init(address1: "14 W 62hd St.", address2: "", city: "Kansas City", state: "MO", postalCode: "64113", country: "US")
        let fullPropertyModel = PropertyModel.init(id: 1, name: "Test", address: address, propDescription: "test", coverPhoto: nil, isRented: true, rentalStart: rentalStart, rentalEnd: rentalEnd, rentalPeriod: 1, rentalPdType: .Year)
        XCTAssertNotNil(fullPropertyModel)
    }
    
    
    
}
