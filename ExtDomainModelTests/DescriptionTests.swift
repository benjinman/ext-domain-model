//
//  DescriptionTests.swift
//  ext-domain-model
//
//  Created by Benjamin Jin on 10/18/16.
//  Copyright © 2016 Benjamin Jin. All rights reserved.
//

import XCTest

class DescriptionTests: XCTestCase {
    func testMoneyDescription() {
        let tenUSD = Money(amount: 10, currency: "USD")
        let fiveGBP = Money(amount: 5, currency: "GBP")
        let fifteenEUR = Money(amount: 15, currency: "EUR")
        let fifteenCAN = Money(amount: 15, currency: "CAN")
        
        XCTAssert(tenUSD.description == "USD10.0")
        XCTAssert(fiveGBP.description == "GBP5.0")
        XCTAssert(fifteenEUR.description == "EUR15.0")
        XCTAssert(fifteenCAN.description == "CAN15.0")
    }
    
    func testJobDescription() {
        
    }
    
    func testPersonDescription() {
        
    }
    
    func testFamilyDescription() {
        
    }
}
