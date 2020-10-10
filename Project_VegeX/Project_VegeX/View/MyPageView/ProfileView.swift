//
//  ProfileView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray
        iv.image = UIImage(named: "02dh")
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "윤다혜님"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let gradeLabel: UILabel = {
        let label = UILabel()
        label.text = "느리너 Lv.1"
        label.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 12)
        label.textAlignment = .center
        label.textColor = .vegeGreen
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(profileImageView.snp.height)
        }
        
        let profileStack = UIStackView(arrangedSubviews: [nameLabel, gradeLabel])
        profileStack.axis = .horizontal
        profileStack.alignment = .bottom
        profileStack.spacing = 8
        
        // --
        
        let tutorialReView = UIView()
        tutorialReView.backgroundColor = UIColor(red: 113/255, green: 160/255, blue: 138/255, alpha: 0.22)
        tutorialReView.layer.cornerRadius = 5
        tutorialReView.clipsToBounds = true
        
        tutorialReView.snp.makeConstraints {
            $0.width.equalTo(138)
            $0.height.equalTo(26)
        }
        
        let tutorialReViewIcon = UIImageView()
        tutorialReViewIcon.image = UIImage(named: "tutorial_reviewicon")
        tutorialReViewIcon.snp.makeConstraints {
            $0.height.width.equalTo(20)
        }
        
        let tutorialReViewLabel = UILabel()
        tutorialReViewLabel.text = "튜토리얼 다시보기"
        tutorialReViewLabel.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 12)
        tutorialReViewLabel.textColor = .vegeTextBlack
        
        let tutorialReViewStack = UIStackView(arrangedSubviews: [tutorialReViewIcon, tutorialReViewLabel])
        tutorialReViewStack.spacing = 8
        tutorialReViewStack.axis = .horizontal
        
        tutorialReView.addSubview(tutorialReViewStack)
        tutorialReViewStack.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        // --
        
        let amountProfileStack = UIStackView(arrangedSubviews: [profileStack, tutorialReView])
        amountProfileStack.spacing = 8
        amountProfileStack.axis = .vertical
        amountProfileStack.alignment = .leading
        
        addSubview(amountProfileStack)
        amountProfileStack.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }
    }
}
