//
//  TutorialMissionCompleteViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class TutorialMissionCompleteViewController: UIViewController {
    
    // MARK: - Properties
    
    private let missionStatusView = UIView()
    
    private let missionStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "1일차 미션 완료!"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 32)
        label.textAlignment = .center
        label.textColor = .vegeGreen
        return label
    }()
    
    private let missionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "채식 인플루언서 1명 팔로우"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 18)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let missionImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "tutorial_treeicon"))
        iv.snp.makeConstraints {
            $0.width.equalTo(132)
            $0.height.equalTo(96)
        }
        return iv
    }()
    
    private let missionPointLabel: UILabel = {
        let label = UILabel()
        label.text = "+20P"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 30)
        label.textAlignment = .center
        label.textColor = .vegeGreen
        return label
    }()
    
    private let missionTalkToLabel: UILabel = {
        let label = UILabel()
        label.text = "윤다혜님, 시작이 절반이에요 👍"
        label.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 18)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let missionAlertLabel: UILabel = {
        let label = UILabel()
        label.text = "내일 열리는 2일차 튜토리얼을 기대해주세요!"
        label.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 14)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private lazy var missionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .vegeLightGreen
        button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        button.addTarget(self, action: #selector(handleButtonEvent), for: .touchUpInside)
        
        button.snp.makeConstraints {
            $0.width.equalTo(288)
            $0.height.equalTo(56)
        }
        button.layer.cornerRadius = 56 / 2
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Seletors
    
    @objc func handleButtonEvent(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(missionStatusView)
        missionStatusView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(450)
            $0.width.equalTo(288)
        }
        
        missionStatusView.addSubview(missionStatusLabel)
        missionStatusLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.leading.trailing.equalToSuperview()
        }
        
        missionStatusView.addSubview(missionTitleLabel)
        missionTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(missionStatusLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        
        missionStatusView.addSubview(missionImageView)
        missionImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(missionTitleLabel.snp.bottom).offset(68)
        }
        
        missionStatusView.addSubview(missionPointLabel)
        missionPointLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(missionImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        let textStackView = UIStackView(arrangedSubviews: [missionTalkToLabel, missionAlertLabel])
        textStackView.spacing = 4
        textStackView.alignment = .center
        textStackView.axis = .vertical
        
        missionStatusView.addSubview(textStackView)
        textStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(missionPointLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        missionStatusView.addSubview(missionButton)
        missionButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textStackView.snp.bottom).offset(48)
        }
    }
}
