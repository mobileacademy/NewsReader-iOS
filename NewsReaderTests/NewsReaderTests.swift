//
//  NewsReaderTests.swift
//  NewsReaderTests
//
//  Created by Mac on 17/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import XCTest
@testable import NewsReader

class NewsReaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchLatestStories(){
        let comm = HackerNewsComm()
        comm.fetchLatestStories()
        
        let expectation = expectationWithDescription("fetch latest stories")
     
        waitForExpectationsWithTimeout(5) { error in
            expectation.fulfill()
        }
    }
    
}
