//
//  TweetUserInfo.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation

class TweetUserInfo {
    var username: String
    var firstName: String
    var lastName: String
    var profilePictureUrl: String?
    
    init(username: String, firstName: String, lastName: String, profilePictureUrl: String? = nil) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.profilePictureUrl = profilePictureUrl
    }
}
