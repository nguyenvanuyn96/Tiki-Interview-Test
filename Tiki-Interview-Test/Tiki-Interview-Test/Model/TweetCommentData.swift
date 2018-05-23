//
//  TweetCommentData.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation

class TweetCommentData {
    var postId: String
    var content: String
    var owner: TweetUserInfo
    
    init(postId: String, content: String, owner: TweetUserInfo) {
        self.postId = postId
        self.content = content
        self.owner = owner
    }
}
