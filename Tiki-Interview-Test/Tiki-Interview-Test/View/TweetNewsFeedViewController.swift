//
//  TweetNewsFeedViewController.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation
import UIKit

class TweetNewsFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TweetPostTableViewCellDelegate, TweetInputMessageViewControllerDelegate {
    
    private var _pushStatusContainer: UIView!
    private var _pushProgressBar: UIProgressView!
    private var _pushStatusLabel: UILabel!
    private var _tableView: UITableView!
    private var _emptyPostLabel: UILabel!
    private var _emptyPostImageView: UIImageView!
    private var _tweetPostArray: [TweetPostData] = [TweetPostData]()
    
    private var _userInfo: TweetUserInfo = TweetUserInfo(username: "nguyenvanuyn96", firstName: "Uy", lastName: "Nguyen Van", profilePictureUrl: "https://photos.google.com/share/AF1QipMS_BbwGk1brR5AJImsHmJ41rzv3qZ7hKsJ2wcnGjCMJf65fjseSO1KOB2Tyk05uw/photo/AF1QipMgO0GvOnGQhhTNwObuzr8f-ASFDPoD8AdsQetg?key=YVpmSHk3cUl3Uy0yUzZBRnhwM1ppOTlPU29KWnJR")
    
    private var _isPushingTweet: Bool = false {
        didSet {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5, animations: {
                    self._tableView.snp.removeConstraints()
                    
                    if self._isPushingTweet {
                        self._tableView.snp.makeConstraints { (make) in
                            make.top.equalTo(self._pushStatusContainer.snp.bottom).offset(5)
                            make.bottom.equalToSuperview()
                            make.trailing.equalToSuperview()
                            make.leading.equalToSuperview()
                        }
                    } else {
                        self._tableView.snp.makeConstraints { (make) in
                            make.top.equalToSuperview().offset(5)
                            make.bottom.equalToSuperview()
                            make.trailing.equalToSuperview()
                            make.leading.equalToSuperview()
                        }
                    }
                    
                    self._tableView.superview?.layoutIfNeeded()
                }, completion: {(completed: Bool) -> Void in
                    //do nothing
                })
            }
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        self.setupView()
        self.setupLayout()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._tweetPostArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetPostTableViewCell.CELL_IDENTIFIER) as! TweetPostTableViewCell
        cell.delegate = self
        if let post = self._tweetPostArray[atIndex: indexPath.row] {
            cell.configureCell(with: post)
        }
        
        return cell
    }
    
    //MARK: - FollowingTableViewCellDelegate
    func didTapLoveButton(postData: TweetPostData) {
        //TODO
    }
    
    func didTapShareButton(postData: TweetPostData) {
        //TODO
    }
    
    func didTapReTweetButton(postData: TweetPostData) {
        //TODO
    }
    
    func didTapSendCommentButton(commentData: TweetCommentData) {
        //TODO
    }
    
    
    //MARK: - Private methods
    private func setupView() {
        self.edgesForExtendedLayout = []
        
        self.navigationController?.navigationBar.isHidden = false
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.getLeftBarCustomView())
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tweet", style: UIBarButtonItemStyle.plain, target: self, action: #selector(didTapRightBarButton))
        
        self.view.backgroundColor = UIColor.lightGray
        
        self._pushStatusContainer = UIView()
        self._pushStatusContainer.backgroundColor = UIColor.white
        
        self._pushProgressBar = UIProgressView()
        
        self._pushStatusLabel = UILabel()
        self._pushStatusLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self._pushStatusLabel.textColor = UIColor.gray
        self._pushStatusLabel.numberOfLines = 1
        self._pushStatusLabel.lineBreakMode = .byTruncatingTail
        self._pushStatusContainer.isHidden = true
        
        self._tableView = UITableView()
        self._tableView.register(TweetPostTableViewCell.self, forCellReuseIdentifier: TweetPostTableViewCell.CELL_IDENTIFIER)
        self._tableView.delegate = self
        self._tableView.dataSource = self
        self._tableView.isHidden = true
        self._tableView.backgroundColor = UIColor.lightGray
        self._tableView.tableFooterView = UIView()
        
        self._emptyPostLabel = UILabel()
        self._emptyPostLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self._emptyPostLabel.textColor = UIColor.gray
        self._emptyPostLabel.numberOfLines = 0
        self._emptyPostLabel.lineBreakMode = .byTruncatingTail
        self._emptyPostLabel.textAlignment = .center
        self._emptyPostLabel.text = "Ops! You don't have any tweet to day!\nLet's write a tweet!"
        self._emptyPostLabel.isHidden = false
        
        self._emptyPostImageView = UIImageView(image: UIImage(named: "newsfeed_icon")?.maskWithColor(UIColor.gray))
        self._emptyPostImageView.contentMode = .scaleAspectFit
        self._emptyPostImageView.isHidden = false
        
        self._pushStatusContainer.addSubview(self._pushStatusLabel)
        self._pushStatusContainer.addSubview(self._pushProgressBar)
        
        self.view.addSubview(self._emptyPostLabel)
        self.view.addSubview(self._emptyPostImageView)
        self.view.addSubview(self._pushStatusContainer)
        self.view.addSubview(self._tableView)
    }
    
    private func setupLayout() {
        
        self._emptyPostImageView.snp.remakeConstraints { (make) in
            make.bottom.equalTo(self._emptyPostLabel.snp.top).offset(-10)
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
        self._emptyPostLabel.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
        
        self._pushStatusContainer.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self._pushProgressBar.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(2)
            make.trailing.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
        }
        
        self._pushStatusLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self._pushProgressBar.snp.bottom).offset(3)
            make.centerX.equalTo(self._pushProgressBar)
            make.leading.greaterThanOrEqualToSuperview().offset(10)
            make.trailing.lessThanOrEqualToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-3)
        }
        
        self._tableView.snp.remakeConstraints { (make) in
            make.top.equalTo(self._pushStatusContainer.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    private func getLeftBarCustomView() -> UIView {
        
        let customView = UIView()
        
        let userProfileImageView = UIImageView(image: UIImage(named: "nguyenvanuyn96_avatar"))
        userProfileImageView.contentMode = .scaleAspectFit
        userProfileImageView.layer.cornerRadius = 16
        userProfileImageView.clipsToBounds = true
        
        let newFeedLabel = UILabel()
        newFeedLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        newFeedLabel.textColor = UIColor.black
        newFeedLabel.numberOfLines = 1
        newFeedLabel.lineBreakMode = .byTruncatingTail
        newFeedLabel.text = "News feed"
        
        customView.addSubview(userProfileImageView)
        customView.addSubview(newFeedLabel)
        
        userProfileImageView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(0)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
            make.width.equalTo(userProfileImageView.snp.height)
        }
        
        newFeedLabel.snp.remakeConstraints { (make) in
            make.leading.equalTo(userProfileImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview().offset(-2)
        }
        
        return customView
    }
    
    @objc private func didTapRightBarButton() {
        //navigate to input tweet content
        let assignVC = TweetInputMessageViewController()
        assignVC.delegate = self
        self.navigationController?.present(UINavigationController(rootViewController: assignVC), animated: true, completion: nil)
    }
    
    //MARK: - TweetInputMessageViewControllerDelegate
    func didTapTweetButton(message: String) {
        if !self._isPushingTweet {
            self._pushStatusLabel.text = "Split message progressing..."
            self._isPushingTweet = true
            self._pushStatusContainer.isHidden = false
        }
        
        DispatchQueue.global().async {
            let messages = TweetSplitProcessed.splitMessage(message)
            
            if let messages = messages {
                var numPosted = 0//Num of tweet which has posted successful
                
                for tweet in messages {
                    //simulate post the tweet to the server side (take a second) and then succeed will include it on the UI
                    
                    numPosted += 1
                    //add the tweet to UI when post succesful
                    let tweetData = TweetPostData(id: "TweetPostData_\(NSUUID().uuidString)", content: tweet, owner: self._userInfo, updatedDate: DateTimeHelper.convertToString(date: Date(), dateformat: DateTimeHelper.DateFormatType.time))
                    
                    self._tweetPostArray.insert(tweetData, at: 0)
                    
                    DispatchQueue.main.async {
                        self._emptyPostLabel.isHidden = true
                        self._emptyPostImageView.isHidden = true
                        self._tableView.isHidden = false
                        self._pushProgressBar.setProgress(Float(numPosted/messages.count), animated: true)
                        self._pushStatusLabel.text = messages.count == 1 ? "Posting done!" : "Posting \(numPosted)/\(messages.count)"
                        self._tableView.reloadData()
                        
                        if self._pushProgressBar.progress == 1.0 {
                            self._isPushingTweet = false
                        }
                    }
                }
            } else {
                self._isPushingTweet = false
                DispatchQueue.main.async {
                    //show popup error that can not split the message because if too long
                    PopupManager.showPopup(title: "Tweet Error", message: "Can not split the message because the message is too long!", completion: {
                        
                    }, actionHandle: {
                        
                    })
                }
            }
        }
    }
}


