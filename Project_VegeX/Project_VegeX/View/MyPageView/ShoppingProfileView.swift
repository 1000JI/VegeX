//
//  ShoppingProfileView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ShoppingProfileView: UIView {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray
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
    
    private let userGradeLabel1: UILabel = {
        let label = UILabel()
        label.text = "윤다혜님 회원등급"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 11)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let mySettingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "mypage_setting_icon"), for: .normal)
        button.snp.makeConstraints {
            $0.width.height.equalTo(44)
        }
        button.tintColor = .vegeTextBlack
        return button
    }()
    
    private var userGradeLabel: UILabel!
    private var totalGradeLabel: UILabel!
    private var upgradePointLabel: UILabel!
    private var joinDateLabel: UILabel!
    
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
        let profileStack = UIStackView(arrangedSubviews: [nameLabel, gradeLabel])
        profileStack.axis = .horizontal
        profileStack.alignment = .bottom
        profileStack.spacing = 8
        
        addSubview(profileStack)
        profileStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
        }
        
        userGradeLabel = makeLabelConfigure(with: "윤다혜님 회원등급")
        totalGradeLabel = makeLabelConfigure(with: "등급 혜택 보기 ›")
        upgradePointLabel = makeLabelConfigure(with: "다음 등급까지 99,999점 남았습니다.")
        joinDateLabel = makeLabelConfigure(with: "가입일: 2020.07.16")
        
        let userGradeStack = makeTextStackView(label1: userGradeLabel, label2: totalGradeLabel)
        let gradeAndJoinStack = makeTextStackView(label1: upgradePointLabel, label2: joinDateLabel)
        
        let amountStack = UIStackView(arrangedSubviews: [userGradeStack, gradeAndJoinStack])
        amountStack.axis = .vertical
        amountStack.distribution = .fillProportionally
        amountStack.spacing = 28
        
        addSubview(amountStack)
        amountStack.snp.makeConstraints {
            $0.top.equalTo(profileStack.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(40)
        }
        
        addSubview(mySettingButton)
        mySettingButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-32)
        }
    }
    
    func makeLabelConfigure(with string: String) -> UILabel {
        let label = UILabel()
        label.text = string
        label.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 11)
        label.textAlignment = .left
        label.textColor = UIColor(rgb: 0x777777)
        return label
    }
    
    func makeTextStackView(label1: UILabel, label2: UILabel) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [label1, label2])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }
}
