//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maria Mezhova on 19.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    private let userPicture = UIImageView(image: UIImage(named: "mysterious-cat.jpg"))
    private let userName = UILabel()
    private let userStatus = UILabel()
    private let statusButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        configureFrames()
    }
    
    func setupUI () {
        addSubview(userPicture)
        addSubview(userName)
        addSubview(userStatus)
        addSubview(statusButton)
    }
    
    func configureFrames() {
        userPicture.frame = CGRect(x: self.safeAreaInsets.right + 16, y: self.safeAreaInsets.top + 16, width: 110, height: 110)
        userPicture.layer.borderWidth = 3.0
        userPicture.layer.borderColor = UIColor.white.cgColor
        userPicture.layer.cornerRadius = userPicture.frame.size.width/2
        userPicture.clipsToBounds = true
        
        userName.frame = CGRect(x: self.safeAreaInsets.right + 150, y: self.safeAreaInsets.top + 27, width: 300, height: 18)
        userName.text = "Mysterious Cat"
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userName.textColor = .black
        
        userStatus.frame = CGRect(x: self.safeAreaInsets.right + 150, y: statusButton.frame.minY - userStatus.bounds.height - 34, width: 300, height: 14)
        userStatus.text = "Learning how to code..."
        userStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        userStatus.textColor = .gray
        
        statusButton.frame = CGRect(x: self.safeAreaInsets.right + 16, y: userPicture.frame.maxY + 16 , width: self.bounds.width - self.safeAreaInsets.left - self.safeAreaInsets.right - 16 * 2, height: 50)
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.backgroundColor = UIColor.blue.cgColor
        statusButton.layer.cornerRadius = 14
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonIsPressed), for: .touchUpInside)
    }
    
    @objc func buttonIsPressed() {
        print (userStatus.text ?? "Status is not available")
    }
}
