//
//  ChallengeProjectReviewView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/18/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeProjectReviewView: UIView {
    
    // MARK: - Properties
    let titleLabel = UILabel()
    let commentImageView = UIImageView()
    let numberOfCommentLabel = UILabel()
    
    
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
        titleLabel.textAlignment = .center
        titleLabel.textColor = .vegeTextBlack
        titleLabel.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 16)
        
        commentImageView.contentMode = .scaleAspectFit
        
        numberOfCommentLabel.textColor = .vegeTextBlack
        numberOfCommentLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
    }
    
    private func setConstraints() {
        [titleLabel, numberOfCommentLabel, commentImageView].forEach {
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        numberOfCommentLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(titleLabel)
        }
        commentImageView.snp.makeConstraints {
            $0.trailing.equalTo(numberOfCommentLabel.snp.leading).inset(-5)
            $0.bottom.equalTo(titleLabel)
        }
    }
}
