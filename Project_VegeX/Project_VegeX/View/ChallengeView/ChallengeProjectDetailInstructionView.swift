//
//  ChallengeProjectDetailReviewView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/18/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeProjectDetailInstructionView: UIView {
    
    // MARK: - Properties
    let mainTitle = UILabel()
    private lazy var imageStackView = UIStackView(arrangedSubviews: [firstImageView, secondImageView])
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let descriptionLabel = UILabel()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - UI
    private func configureUI() {
        setPropertyAttributes()
        setConstraints()
    }
    
    private func setPropertyAttributes() {
        [mainTitle, descriptionLabel].forEach {
            $0.numberOfLines = 0
        }
        
        mainTitle.textColor = .vegeTextBlack
        mainTitle.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 16)
        
        descriptionLabel.textColor = .vegeTextBlack
        descriptionLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        
        [firstImageView, secondImageView].forEach {
            $0.contentMode = .scaleAspectFit
        }
        
        imageStackView.alignment = .center
        imageStackView.axis = .horizontal
        imageStackView.distribution = .fillEqually
        imageStackView.spacing = 10
    }
    
    private func setConstraints() {
        [mainTitle, imageStackView, descriptionLabel].forEach {
            addSubview($0)
        }
        mainTitle.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.15)
        }
        imageStackView.snp.makeConstraints {
            $0.top.equalTo(mainTitle.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(imageStackView.snp.bottom).offset(4)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
}
