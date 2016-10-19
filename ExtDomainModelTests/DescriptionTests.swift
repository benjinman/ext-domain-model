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
        let QFC = Job(title: "Courtesy Clerk", type: Job.JobType.Hourly(9.42))
        let youTuber = Job(title: "Vlogger", type: Job.JobType.Salary(100000))
        
        XCTAssert(QFC.description == "Courtesy Clerk position, 9.42 hourly pay")
        XCTAssert(youTuber.description == "Vlogger position, 100000 annual pay")
    }
    
    func testPersonDescription() {
        let ben = Person(firstName: "Benjamin", lastName: "Jin", age: 20)
        ben.job = nil
        ben.spouse = nil
        
        XCTAssert(ben.description == "[Person: firstName:Benjamin lastName:Jin age:20 job:nil spouse:nil]")
    }
    
    func testFamilyDescription() {
        let bill = Person(firstName: "Bill", lastName: "Nye", age: 46)
        let jill = Person(firstName: "Jill", lastName: "Nye", age: 45)
        let family = Family(spouse1: bill, spouse2: jill)
        
        print(family.description)
        XCTAssert(family.description == "Family members: \n  [Person: firstName:Bill lastName:Nye age:46 job:nil spouse:Jill]\n  [Person: firstName:Jill lastName:Nye age:45 job:nil spouse:Bill]")
    }
}

class MathematicsTests: XCTestCase {
    let twentyUSD = Money(amount: 20, currency: "USD")
    let fiveGBP = Money(amount: 5, currency: "GBP")
    let thirtyEUR = Money(amount: 30, currency: "EUR")
    let twentyFiveCAN = Money(amount: 25, currency: "CAN")
    
    func testAddUSDtoUSD() {
        let total = twentyUSD.add(twentyUSD)
        XCTAssert(total.amount == 40)
        XCTAssert(total.currency == "USD")
    }
    
    func testAddUSDtoGBP() {
        let total = twentyUSD.add(fiveGBP)
        XCTAssert(total.amount == 15)
        XCTAssert(total.currency == "GBP")
    }
    
    func testSubtractCANfromEUR() {
        let total = twentyFiveCAN.subtract(thirtyEUR)
        XCTAssert(total.amount == 0)
        XCTAssert(total.currency == "EUR")
    }
    
    func testSubtractUSDfromCAN() {
        let total = twentyUSD.subtract(twentyFiveCAN)
        XCTAssert(total.amount == 0)
        XCTAssert(total.currency == "CAN")
    }
}

class ExtensionTests: XCTestCase {
    func testUSD() {
        let doubleExtended = 20.USD
        let twentyUSD = Money(amount: 20, currency: "USD")
        XCTAssert(doubleExtended.amount == twentyUSD.amount && doubleExtended.currency == twentyUSD.currency)
    }
    
    func testEUR() {
        let doubleExtended = 15.EUR
        let fifteenEUR = Money(amount: 15, currency: "EUR")
        XCTAssert(doubleExtended.amount == fifteenEUR.amount && doubleExtended.currency == fifteenEUR.currency)
    }
    
    func testGBP() {
        let doubleExtended = 30.GBP
        let thirtyGBP = Money(amount: 30, currency: "GBP")
        XCTAssert(doubleExtended.amount == thirtyGBP.amount && doubleExtended.currency == thirtyGBP.currency)
    }
    
    func testYEN() {
        let doubleExtended = 100.YEN
        let hundredYEN = Money(amount: 100, currency: "YEN")
        XCTAssert(doubleExtended.amount == hundredYEN.amount && doubleExtended.currency == hundredYEN.currency)
    }
}
