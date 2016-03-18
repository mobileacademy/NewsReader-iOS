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
        
        let expectation = expectationWithDescription("fetch latest stories")
        
        comm.fetchLatestStories(){ collection in
            expectation.fulfill()
        }
      
        waitForExpectationsWithTimeout(5) { error in
            if error != nil {
                XCTFail("stories weren't fetched in 5 seconds")
            }
        }
    }
    
    func testFetchTopStories(){
        let comm = HackerNewsComm()
        
        let exp = expectationWithDescription("fetch top stories")
        
        comm.fetchTopStories { collection in
            exp.fulfill()
        }
        
        waitForExpectationsWithTimeout(5){ error in
            if error != nil {
                XCTFail("top stories weren't fetched in 5 seconds")
            }
        }
    }
    
}
