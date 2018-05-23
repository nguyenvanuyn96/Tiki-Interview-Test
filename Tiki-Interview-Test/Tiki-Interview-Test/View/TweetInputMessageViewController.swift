//
//  TweetInputMessageViewController.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation
import UIKit

protocol TweetInputMessageViewControllerDelegate: class {
    func didTapTweetButton(message: String)
}

class TweetInputMessageViewController: UIViewController, UITextViewDelegate {
    private var _userProfileImageView: UIImageView!
    private var _messageTextView: UITextView!
    private var _messagePlaceholderLabel: UILabel!
    
    weak var delegate: TweetInputMessageViewControllerDelegate?
    
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
    
    private func setupView() {
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close_button"), style: UIBarButtonItemStyle.done, target: self, action: #selector(didTapLeftBarButton))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: UIBarButtonItemStyle.plain, target: self, action: #selector(didTapRightBarButton))
        
        self._userProfileImageView = UIImageView(image: UIImage(named:"nguyenvanuyn96_avatar"))
        self._userProfileImageView.contentMode = UIViewContentMode.scaleAspectFit
        self._userProfileImageView.layer.cornerRadius = 25
        self._userProfileImageView.clipsToBounds = true
        
        self._messageTextView = UITextView()
        self._messageTextView.isEditable = true
        self._messageTextView.delegate = self
        self._messageTextView.autocapitalizationType = .sentences
        self._messageTextView.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        self._messageTextView.textColor = UIColor.black
        self._messageTextView.text = "Apart from counting words and characters, our online editor can help you to improve word choice and writing style, and, optionally, help you to detect grammar mistakes and plagiarism."//"Lorem Ipsum is simply dummy text of the printing."
        self._messageTextView.becomeFirstResponder()
        
        self._messagePlaceholderLabel = UILabel()
        self._messagePlaceholderLabel.textColor = UIColor.gray
        self._messagePlaceholderLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        self._messagePlaceholderLabel.text = "What's on your mind, Uy?"
        
        self.view.addSubview(self._userProfileImageView)
        self.view.addSubview(self._messageTextView)
        self.view.addSubview(self._messagePlaceholderLabel)
    }
    
    private func setupLayout() {
        self._userProfileImageView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.height.equalTo(self._userProfileImageView.snp.width)
        }
        
        self._messagePlaceholderLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self._userProfileImageView)
            make.leading.equalTo(self._userProfileImageView.snp.trailing).offset(13)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
        
        self._messageTextView.snp.remakeConstraints { (make) in
            make.top.equalTo(self._userProfileImageView)
            make.leading.equalTo(self._userProfileImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self._messagePlaceholderLabel.isHidden = textView.text != ""
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self._messagePlaceholderLabel.isHidden = textView.text != ""
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self._messagePlaceholderLabel.isHidden = textView.text != ""
    }
    
    @objc private func didTapRightBarButton() {
        self.delegate?.didTapTweetButton(message: self._messageTextView.text)
        self.pushBackViewController()
    }
    
    @objc private func didTapLeftBarButton() {
        self.pushBackViewController()
    }
    
    private func pushBackViewController() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}

