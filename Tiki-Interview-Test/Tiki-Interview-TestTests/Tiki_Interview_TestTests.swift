//
//  Tiki_Interview_TestTests.swift
//  Tiki-Interview-TestTests
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import XCTest
@testable import Tiki_Interview_Test

class Tiki_Interview_TestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSplitMessageWithEmptyMessage() {
        let splitedMessages = TweetSplitProcessed.splitMessage("")
        
        XCTAssert(splitedMessages?.count == 0, "Should return empty array splited message when user input empty message!")
    }
    
    func testSplitMessageWithLengthLessThan50Chars() {
        let splitedMessages = TweetSplitProcessed.splitMessage("Uy Nguyen Van")
        
        XCTAssert(splitedMessages?.count == 1, "Should return only one message when user input message which has length less than 50 characters!")
    }
    
    func testSplitMessageWithLengthEqualTo50Chars() {
        //TODO
    }
    
    func testSplitMessageWithLengthGreaterThan50CharsAndHasOnlyOneWord() {
        //TODO
    }
    
    func testSplitMessageWithLengthGreaterThan50CharsAndHasMoreThanOneWordAndHasLengthEachWordLessThan50Chars() {
        //TODO
    }
    
    func testSplitMessageWithLengthGreaterThan50CharsAndHasMoreThanOneWordAndHasTheFirstWordWhichHasLengthGreaterThan50Chars() {
        //TODO
    }
    
    func testSplitMessageWithLengthGreaterThan50CharsAndHasMoreThanOneWordAndHasTheEndWordWhichHasLengthGreaterThan50Chars() {
        //TODO
    }
    
    func testSplitMessageWithLengthGreaterThan50CharsAndHasMoreThanOneWordAndHasAnyMiddleWordWhichHasLengthGreaterThan50Chars() {
        //TODO
    }
    
    func testSplitMessageWithLengthGreaterThan50CharsAndHasMoreThanOneWordAndHasLengthEachWordLessThan50CharsAndSplitedMessagesAreOptimized() {
        //TODO
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
