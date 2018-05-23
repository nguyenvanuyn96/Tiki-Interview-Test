//
//  DateTimeHelper.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation

class DateTimeHelper {
    /// Date Format type
    enum DateFormatType: String {
        /// Time
        case time = "HH:mm:ss"
        
        /// Date with hours
        case dateWithTime = "yyyy-MM-dd HH:mm:ss"
        
        /// Date
        case date = "dd-MMM-yyyy"
        
        case dayMonth = "dd-MMM"
    }
    
    /// Convert Date to String
    static func convertToString(date: Date, dateformat formatType: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType.rawValue // Your New Date format as per requirement change it own
        
        let newDate: String = dateFormatter.string(from: date) // pass Date here
        print(newDate) // New formatted Date string
        
        return newDate
    }
}

