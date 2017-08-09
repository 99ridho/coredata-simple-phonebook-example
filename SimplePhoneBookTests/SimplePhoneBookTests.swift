//
//  SimplePhoneBookTests.swift
//  SimplePhoneBookTests
//
//  Created by Muhammad Ridho on 8/9/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import XCTest
@testable import SimplePhoneBook

class SimplePhoneBookTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInsertingPhoneBookDataToCoreData() {
        let dap = PhoneBookDataAccessProvider()
        
        // fetch initial count from database
        let initialDataCount = dap.fetchPhoneBookData().count
        
        // inserting new data
        let name = "Ade"
        let phoneNumber = "+628123456789"
        _ = dap.addPhoneBookData(name: name, phoneNumber: phoneNumber)
        
        // fetch data count after inserting new data
        let data = dap.fetchPhoneBookData()
        let finalDataCount = data.count
        
        NSLog("Phone book data: %@", data)
        XCTAssertEqual(initialDataCount + 1, finalDataCount)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
