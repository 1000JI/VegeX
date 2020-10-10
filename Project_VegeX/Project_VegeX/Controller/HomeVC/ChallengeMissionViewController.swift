//
//  ChallengeMissionViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol ChallengeMissionViewControllerDelegate: class {
    func handleDismissal()
}

class ChallengeMissionViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: ChallengeMissionViewControllerDelegate?
    
    private let missionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let smallMissionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "이 챌린지에 참여하실건가요?"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 15)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let missionLabel: UILabel = {
        let label = UILabel()
        label.text = "‘고기 대신’ 제품 6종\n활용해서 밥상 차리기"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 20)
        label.textAlignment = .center
        label.textColor = .vegeGreen
        label.numberOfLines = 2
        return label
    }()
    
    private let challengeButton = TutorialMakeButton(type: .system, buttonType: .green, text: "도전💪")
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 0.3) {
                self.missionView.transform = .identity
            }
        }
    }
    
    // MARK: - Seletors
    
    @objc func handleTry(_ sender: UIButton) {
        dismiss(animated: true, completion: {
            ChallengeSaveData.shared.proccessingData.insert(Challenge(
                title: "[롯데마트] ‘고기 대신’ 6종 활용해서 밥상 차리기",
                cycle: "주간 - 주1회",
                date: "2020.08.01~08.15",
                rate: 0,
                imageName: "02_lotte",
                status: .processing), at: 0)
            self.delegate?.handleDismissal()
        })
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        let viewHeight: CGFloat = 280
        
        view.addSubview(missionView)
        missionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
            $0.height.equalTo(viewHeight)
        }
        missionView.transform = CGAffineTransform(translationX: 0, y: viewHeight)
        
        missionView.addSubview(smallMissionTitleLabel)
        smallMissionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.centerX.equalToSuperview()
        }
        
        missionView.addSubview(missionLabel)
        missionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(smallMissionTitleLabel.snp.bottom).offset(24)
        }
        
        missionView.addSubview(challengeButton)
        challengeButton.snp.makeConstraints {
            $0.top.equalTo(missionLabel.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
        }
        
        challengeButton.addTarget(self, action: #selector(handleTry), for: .touchUpInside)
    }
    
}
