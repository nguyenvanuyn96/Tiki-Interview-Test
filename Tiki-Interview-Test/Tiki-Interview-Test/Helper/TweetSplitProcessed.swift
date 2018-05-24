//
//  TweetSplitProcessed.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation

public extension Int {
    /// returns number of digits in Int number
    public var digitCount: Int {
        get {
            return numberOfDigits(in: self)
        }
    }
    /// returns number of useful digits in Int number
    public var usefulDigitCount: Int {
        get {
            var count = 0
            for digitOrder in 0..<self.digitCount {
                /// get each order digit from self
                let digit = self % (Int(pow(10, digitOrder + 1) as NSDecimalNumber))
                    / Int(pow(10, digitOrder) as NSDecimalNumber)
                if isUseful(digit) { count += 1 }
            }
            return count
        }
    }
    // private recursive method for counting digits
    private func numberOfDigits(in number: Int) -> Int {
        if abs(number) < 10 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number/10)
        }
    }
    // returns true if digit is useful in respect to self
    private func isUseful(_ digit: Int) -> Bool {
        return (digit != 0) && (self % digit == 0)
    }
}

class TweetSplitProcessed {
    
    static func splitMessage(_ message: String, maxLengthOfMessage: Int = 50, isExcludeSurroundingQuotes: Bool = true) -> [String]? {
        
        var splitedMessages: [String]? = nil
        
        if message.isEmpty {
            splitedMessages = [String]()
        } else if message.count <= maxLengthOfMessage {
            splitedMessages = [message]
        } else {
            splitedMessages = [String]()
            
            let wordList = message.split(separator: " ")
            var lengthOfNumberSplitedMessages = Int(ceil(Double(message.count)/Double(maxLengthOfMessage))).digitCount
            while true {
                var tempSplitedMessages = [String]()
                var subMessage = String()
                var numSplitedMessage: Int = 1
                var i = 0
                
                while (i < wordList.count) {
                    let lengthOfPartIndicator = (numSplitedMessage.digitCount /* length of part number */ + 1 /* the / */ + lengthOfNumberSplitedMessages /* length of num splited messages */ + 1 /* space */)
                    
                    if lengthOfPartIndicator + wordList[i].count > maxLengthOfMessage {//In case the word too long exceed the limit
                        return nil
                    }
                    
                    if lengthOfPartIndicator + subMessage.count + wordList[i].count <= maxLengthOfMessage {
                        subMessage.append(" \(String(wordList[i]))")
                    } else {
                        numSplitedMessage += 1
                        tempSplitedMessages.append(subMessage)
                        
                        if numSplitedMessage.digitCount > lengthOfNumberSplitedMessages {
                            break
                        }
                        
                        subMessage = ""//Reset the message
                        i -= 1//Reset to reviewing the previous word
                    }
                    
                    if i == wordList.count - 1 {//Add the last word to a splited message
                        numSplitedMessage += 1
                        tempSplitedMessages.append(subMessage)
                        
                        subMessage = ""//Reset the message
                    }
                    
                    i += 1
                }
                
                if numSplitedMessage.digitCount > lengthOfNumberSplitedMessages {
                    lengthOfNumberSplitedMessages += 1
                } else if lengthOfNumberSplitedMessages == tempSplitedMessages.count.digitCount {
                    for i in 1...tempSplitedMessages.count {
                        splitedMessages?.append("\(i)/\(tempSplitedMessages.count)\(tempSplitedMessages[i-1])")
                    }
                    
                    break
                } else {
                    lengthOfNumberSplitedMessages = tempSplitedMessages.count.digitCount
                }
            }
        }
        
        return splitedMessages
    }
}
