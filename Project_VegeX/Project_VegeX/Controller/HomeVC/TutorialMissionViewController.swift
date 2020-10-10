//
//  TutorialMissionViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol TutorialMissionViewControllerDelegate: class {
    func handlePopController()
}

class TutorialMissionViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: TutorialMissionViewControllerDelegate?
    
    private let missionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let smallMissionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "DAY 1. 채식에 대한 오해와 진실"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textAlignment = .left
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let missionLabel: UILabel = {
        let label = UILabel()
        label.text = "채식 인플루언서 1명 팔로우"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 22)
        label.textAlignment = .center
        label.textColor = .vegeGreen
        return label
    }()
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "👩🧑🤳"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        
        let attributedString = NSMutableAttributedString(string: """
혹시 다른 사람들은 채식을 어떻게 하고 있을지
궁금하지 않으신가요?

유튜브, 인스타그램 등에서 활발히 활동하는
채식, 비거니즘 채널/인플루언서들을
구독하는 것이 오늘의 미션이에요!

구독 후 화면 스크린샷을 인증해 주세요!

SNS를 잘 하지 않는다면
베지테리언을 위한
""")
        attributedString.append(NSAttributedString(
            string: "뉴스레터",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.vegeGreen,
                NSAttributedString.Key.font: VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14),
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
        ]))
        
        attributedString.append(NSAttributedString(string: """
를 구독해보는 건 어떨까요?


"""))
        
        attributedString.append(NSAttributedString(string: " 느린채식 팀이 추천하는 SNS계정 알아보기>>", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.vegeGreen,
            NSAttributedString.Key.font: VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14),
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
        ]))
        
        label.attributedText = attributedString
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        button.backgroundColor = UIColor(rgb: 0x71A08A)
        button.addTarget(self, action: #selector(clickedConfirmEvent), for: .touchUpInside)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 0.3) {
                self.missionView.transform = .identity
            }
        }
    }
    
    // MARK: - Seletors
    
    @objc func clickedConfirmEvent(_ sender: UIButton) {
        var presentTutorial: Tutorial!
        TutorialService.shared.getPresentTutorial { tutorial in
            presentTutorial = tutorial
        }
        presentTutorial.status = .ongoing
        TutorialService.shared.setTutorial(to: presentTutorial, status: .ongoing)
        
        dismiss(animated: true) {
            self.delegate?.handlePopController()
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        let viewHeight: CGFloat = 542
        
        view.addSubview(missionView)
        missionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(viewHeight)
        }
        missionView.transform = CGAffineTransform(translationX: 0, y: viewHeight)
        
        missionView.addSubview(smallMissionTitleLabel)
        smallMissionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        let todayLabel = UILabel()
        todayLabel.text = "오늘의 미션"
        todayLabel.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 16)
        todayLabel.textAlignment = .center
        todayLabel.textColor = .vegeTextBlack
        
        let missionStack = UIStackView(arrangedSubviews: [todayLabel, missionLabel])
        missionStack.axis = .vertical
        missionStack.distribution = .fillProportionally
        missionStack.spacing = 4
        
        missionView.addSubview(missionStack)
        missionStack.snp.makeConstraints {
            $0.top.equalTo(smallMissionTitleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        missionView.addSubview(emojiLabel)
        emojiLabel.snp.makeConstraints {
            $0.top.equalTo(missionStack.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        missionView.addSubview(contentsLabel)
        contentsLabel.snp.makeConstraints {
            $0.top.equalTo(emojiLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(306)
        }
        
        missionView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(contentsLabel.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
        }
    }
}
