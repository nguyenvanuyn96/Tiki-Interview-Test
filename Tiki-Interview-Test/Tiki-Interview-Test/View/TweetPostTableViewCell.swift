//
//  TweetPostTableViewCell.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol TweetPostTableViewCellDelegate: class {
    func didTapLoveButton(postData: TweetPostData)
    func didTapShareButton(postData: TweetPostData)
    func didTapReTweetButton(postData: TweetPostData)
    func didTapSendCommentButton(commentData: TweetCommentData)
}

class TweetPostTableViewCell: UITableViewCell {
    static var CELL_IDENTIFIER: String { return "TweetPostTableViewCell" }
    
    private var _mainContainerView: UIView!
    
    private var _userProfileImageView: UIImageView!
    private var _userFullNameLabel: UILabel!
    private var _usernameLabel: UILabel!
    private var _updatedDateLabel: UILabel!
    private var _messageLabel: UILabel!
    
    private var _controlContainerView: UIView!
    private var _commentButton: UIButton!
    private var _loveButton: UIButton!
    private var _reTweetButton: UIButton!
    private var _shareButton: UIButton!
    
    private var _postData: TweetPostData!
    
    weak var delegate: TweetPostTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupLayout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Setup init view component.
    private func setupViews() {
        self.backgroundColor = UIColor(white: 1, alpha: 0)
        
        self._mainContainerView = UIView()
        self._mainContainerView.backgroundColor = UIColor.white
        
        self._userProfileImageView = UIImageView(image: UIImage(named:"nguyenvanuyn96_avatar"))
        self._userProfileImageView.contentMode = UIViewContentMode.scaleAspectFit
        self._userProfileImageView.layer.cornerRadius = 25
        self._userProfileImageView.clipsToBounds = true
        
        self._userFullNameLabel = UILabel()
        self._userFullNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self._userFullNameLabel.textColor = UIColor.black
        self._userFullNameLabel.numberOfLines = 1
        self._userFullNameLabel.lineBreakMode = .byTruncatingTail
        self._userFullNameLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: UILayoutConstraintAxis.horizontal)
        
        self._usernameLabel = UILabel()
        self._usernameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self._usernameLabel.textColor = UIColor.gray
        self._usernameLabel.numberOfLines = 1
        self._usernameLabel.lineBreakMode = .byTruncatingTail
        //        self._usernameLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: UILayoutConstraintAxis.horizontal)
        
        self._updatedDateLabel = UILabel()
        self._updatedDateLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self._updatedDateLabel.textColor = UIColor.gray
        self._updatedDateLabel.numberOfLines = 1
        self._updatedDateLabel.lineBreakMode = .byTruncatingTail
        self._updatedDateLabel.textAlignment = .left
        
        self._messageLabel = UILabel()
        self._messageLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self._messageLabel.textColor = UIColor.black
        self._messageLabel.numberOfLines = 0
        self._messageLabel.lineBreakMode = .byTruncatingTail
        
        self._controlContainerView = UIView()
        
        self._commentButton = UIButton()
        self._commentButton.setBackgroundImage(UIImage(named: "comment_button")?.maskWithColor(UIColor.darkGray), for: UIControlState.normal)
        self._commentButton.contentMode = .scaleAspectFit
        
        self._loveButton = UIButton()
        self._loveButton.setBackgroundImage(UIImage(named: "love_button")?.maskWithColor(UIColor.darkGray), for: UIControlState.normal)
        
        self._reTweetButton = UIButton()
        self._reTweetButton.setBackgroundImage(UIImage(named: "retweet_button")?.maskWithColor(UIColor.darkGray), for: UIControlState.normal)
        
        self._shareButton = UIButton()
        self._shareButton.setBackgroundImage(UIImage(named: "share_button")?.maskWithColor(UIColor.darkGray), for: UIControlState.normal)
        
        self._mainContainerView.addSubview(self._userProfileImageView)
        self._mainContainerView.addSubview(self._userFullNameLabel)
        self._mainContainerView.addSubview(self._usernameLabel)
        self._mainContainerView.addSubview(self._updatedDateLabel)
        self._mainContainerView.addSubview(self._messageLabel)
        self._mainContainerView.addSubview(self._controlContainerView)
        
        self._controlContainerView.addSubview(self._commentButton)
        self._controlContainerView.addSubview(self._loveButton)
        self._controlContainerView.addSubview(self._reTweetButton)
        self._controlContainerView.addSubview(self._shareButton)
        
        self.addSubview(self._mainContainerView)
    }
    
    /// Setup Layout for view component.
    private func setupLayout() {
        self._mainContainerView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self._userProfileImageView.snp.remakeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(self._userProfileImageView.snp.width)
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        self._usernameLabel.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._userFullNameLabel.snp.trailing).offset(5)
            make.centerY.equalTo(self._userFullNameLabel)
            make.trailing.lessThanOrEqualTo(self._mainContainerView.snp.centerX).multipliedBy(1.75)
            make.height.equalTo(self._userFullNameLabel)
        }
        //        self._usernameLabel.backgroundColor = UIColor.green
        
        self._userFullNameLabel.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._userProfileImageView.snp.trailing).offset(10)
            make.top.equalTo(self._userProfileImageView)
            //            make.trailing.lessThanOrEqualTo(self._mainContainerView.snp.centerX).multipliedBy(1.75)
            make.height.equalTo(40)
        }
        //        self._userFullNameLabel.backgroundColor = UIColor.blue
        
        
        self._updatedDateLabel.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._usernameLabel.snp.trailing).offset(5)
            make.centerY.equalTo(self._userFullNameLabel)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(self._userFullNameLabel)
        }
        //        self._updatedDateLabel.backgroundColor = UIColor.red
        
        self._messageLabel.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._userFullNameLabel)
            make.top.equalTo(self._userFullNameLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(self._controlContainerView.snp.top).offset(-10)
        }
        
        self._controlContainerView.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._userFullNameLabel)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(40)
            make.bottom.equalToSuperview()
        }
        
        self._commentButton.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(self._commentButton.snp.width)
            make.width.equalTo(22)
        }
        
        self._reTweetButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._controlContainerView.snp.centerX).multipliedBy(0.5)
            make.centerY.equalToSuperview()
            make.width.equalTo(self._commentButton.snp.width)
            make.height.equalTo(self._commentButton.snp.width)
        }
        
        self._loveButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._controlContainerView.snp.centerX)
            make.centerY.equalToSuperview()
            make.width.equalTo(self._commentButton.snp.width)
            make.height.equalTo(self._commentButton.snp.width)
        }
        
        self._shareButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._controlContainerView.snp.centerX).multipliedBy(1.5)
            make.centerY.equalToSuperview()
            make.width.equalTo(self._commentButton.snp.width)
            make.height.equalTo(self._commentButton.snp.width)
        }
    }
    
    func configureCell(with post: TweetPostData) {
        self._postData = post
        
        //        if let userPictureUrl = post.owner.profilePictureUrl {
        //            self._userProfileImageView.downloadedFrom(link: userPictureUrl)
        //        }
        self._userFullNameLabel.text = "\(post.owner.firstName) \(post.owner.lastName)"
        //        self._usernameLabel.text = "@\(post.owner.username)"
        self._updatedDateLabel.text = "\(post.updatedDate)"
        self._messageLabel.text = "\(post.content) - Length = \(post.content.count)"
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if isHighlighted {
            self._mainContainerView.backgroundColor = UIColor.darkGray
        } else {
            self._mainContainerView.backgroundColor = UIColor.white
        }
    }
}

