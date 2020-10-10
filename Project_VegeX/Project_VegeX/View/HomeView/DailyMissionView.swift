//
//  DailyMissionView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/19.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol DailyMissionViewDelegate: class {
    func handleStatusEvent()
}

class DailyMissionView: UIView {
    
    // MARK: - Properties
    
    var tutorial: Tutorial? {
        didSet { configure() }
    }
    
    weak var delegate: DailyMissionViewDelegate?
    
    private let missionImageView: UIImageView = {
        let missionImageView = UIImageView()
        missionImageView.contentMode = .scaleAspectFill
        missionImageView.image = UIImage(named: "VegetableBackground")
        return missionImageView
    }()
    
    private let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.text = "TEST"
        dayLabel.textAlignment = .center
        dayLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 16)
        dayLabel.textColor = .white
        return dayLabel
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "TITLE LABEL"
        titleLabel.textAlignment = .center
        titleLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 18)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton(type: .system)
        statusButton.setTitle("진행하기", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        statusButton.layer.borderColor = UIColor.white.cgColor
        statusButton.layer.borderWidth = 1.0
        statusButton.layer.cornerRadius = 28 / 2
        statusButton.addTarget(self, action: #selector(handleStatus), for: .touchUpInside)
        return statusButton
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        let missionView = UIView()
        missionView.layer.cornerRadius = 10
        missionView.clipsToBounds = true
        missionView.layer.shadowColor = UIColor.lightGray.cgColor
        missionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        missionView.layer.shadowRadius = 5
        missionView.layer.shadowOpacity = 0.5
        
        missionView.addSubview(missionImageView)
        missionImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let alphaView = UIView()
        alphaView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        missionImageView.addSubview(alphaView)
        alphaView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        let titleStack = UIStackView(arrangedSubviews: [dayLabel, titleLabel])
        titleStack.axis = .vertical
        titleStack.spacing = 0
        titleStack.alignment = .center
        
        missionView.addSubview(titleStack)
        titleStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(24)
        }
        
        missionView.addSubview(statusButton)
        statusButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(28)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleStack.snp.bottom).offset(12)
        }
        
        addSubview(missionView)
        missionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure() {
        guard let tutorial = tutorial else { return }
        let viewModel = TutorialViewModel(tutorial: tutorial)
        
        dayLabel.text = viewModel.dayText
        dayLabel.textColor = viewModel.dayTextColor
        titleLabel.text = viewModel.titleText
        
        statusButton.setTitle(viewModel.buttonText, for: .normal)
        statusButton.setTitleColor(viewModel.buttonColor[0], for: .normal)
        statusButton.backgroundColor = viewModel.buttonColor[1]
        
        missionImageView.image = UIImage(named: tutorial.imageName)
    }
    
    // MARK: - Selectors
    
    @objc func handleStatus() {
        delegate?.handleStatusEvent()
    }
}
