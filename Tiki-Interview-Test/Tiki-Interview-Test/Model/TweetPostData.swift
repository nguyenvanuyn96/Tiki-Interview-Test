//
//  TweetPostData.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation

class TweetPostData {
    var id: String
    var owner: TweetUserInfo
    var content: String
    var updatedDate: String
    var like: [TweetUserInfo]
    var comment: [TweetCommentData]
    var share: [TweetUserInfo]
    
    init(id: String, content: String, owner: TweetUserInfo, updatedDate: String, like: [TweetUserInfo] = [TweetUserInfo](), comment: [TweetCommentData] = [TweetCommentData](), share: [TweetUserInfo] = [TweetUserInfo]()) {
        self.id = id
        self.owner = owner
        self.content = content
        self.updatedDate = updatedDate
        self.like = like
        self.comment = comment
        self.share = share
    }
}
