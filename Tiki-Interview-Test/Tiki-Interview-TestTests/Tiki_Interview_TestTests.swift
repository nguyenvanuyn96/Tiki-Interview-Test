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
        let splitedMessages = TweetSplitProcessed.splitMessage("You’re now going to leave the comfortable world of")
        
        XCTAssert(splitedMessages?.count == 1, "Should return only one message when user input message which has length equal to 50 characters!")
    }
    
    func testSplitMessageWithLengthGreaterThan50CharsAndHasOnlyOneWord() {
        let splitedMessages = TweetSplitProcessed.splitMessage("ApartfromcountingwordsandcharactersUronlineeditorcanhelpyoutoimprovewordchoice")
        
        XCTAssert(splitedMessages == nil, "Should return nil array when user input message which has length greater than 50 characters and has only word!")
    }
    
    func testSplitMessageWithLengthGreaterThan50CharsAndHasMoreThanOneWordAndHasLengthEachWordLessThan50Chars() {
        let splitedMessages = TweetSplitProcessed.splitMessage("Apart from counting words and characters, our online editor can help you to improve word choice and writing style, and, optionally, help you to detect grammar mistakes and plagiarism.")
        if let splitedMessages = splitedMessages {
            XCTAssert(splitedMessages.count > 1, "Should return at least 2 message items when user input the message which has length greater than 50 characters and has more than one word and length's each word less than 50 characters!")
            for message in splitedMessages {
                XCTAssert(message.count <= 50, "The message splited should be has length less than or equal to 50 characters!")
            }
        }

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
