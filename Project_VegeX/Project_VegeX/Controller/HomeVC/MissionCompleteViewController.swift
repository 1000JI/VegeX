//
//  MissionCompleteViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class MissionCompleteViewController: UIViewController {
    
    // MARK: - Properties
    
    private let missionCompleteView = UIView()
    
    private let missionStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "15% 달성!"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 28)
        label.textAlignment = .center
        label.textColor = .vegeGreen
        return label
    }()
    
    private let missionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "페이크미트 햄버거 맛집 도장깨기"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 18)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let confirmImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "tutorial_hamburger"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020.07.23"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "윤다혜님,\n오늘도 지구와 함께 더 건강해지셨어요! 🌏"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        label.numberOfLines = 2
        return label
    }()
    
    private let confirmButton = TutorialMakeButton(type: .system, buttonType: .green, text: "야호! 신난다")
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let minY = missionStatusLabel.frame.minY
        let maxY = confirmButton.frame.maxY
        
        missionCompleteView.snp.makeConstraints {
            $0.height.equalTo(maxY - minY)
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(missionCompleteView)
        missionCompleteView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        let completeLabelStack = UIStackView(arrangedSubviews: [missionStatusLabel, missionTitleLabel])
        completeLabelStack.axis = .vertical
        completeLabelStack.spacing = 4
        
        missionCompleteView.addSubview(completeLabelStack)
        completeLabelStack.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        missionCompleteView.addSubview(confirmImageView)
        confirmImageView.snp.makeConstraints {
            $0.top.equalTo(completeLabelStack.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
            $0.height.equalTo(confirmImageView.snp.width)
        }
        
        confirmImageView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        missionCompleteView.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(confirmImageView.snp.bottom).offset(28)
        }
        
        missionCompleteView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(bottomLabel.snp.bottom).offset(40)
        }
    }
}
