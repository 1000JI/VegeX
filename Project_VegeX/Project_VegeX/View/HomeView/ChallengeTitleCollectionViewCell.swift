//
//  ChallengeTitleCollectionViewCell.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/15/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeTitleCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "ChallengeTitleCollectionViewCell"
    
    let imageView = UIImageView()
    
    let missionTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .vegeTextBlack
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 13)
        return label
    }()
    
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .vegeGreen
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .vegeTextBlack
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        return label
    }()
    
    lazy var commentInfoStackView = UIStackView(arrangedSubviews: [likeStackView, commentStackView])
    lazy var likeStackView = UIStackView(arrangedSubviews: [likeIconImageView, likeNumberLabel])
    let likeIconImageView = UIImageView()
    let likeNumberLabel = UILabel()
    
    lazy var commentStackView = UIStackView(arrangedSubviews: [commentIconImageView, commentNumberLabel])
    let commentIconImageView = UIImageView()
    let commentNumberLabel = UILabel()
    
    
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
        backgroundColor = .systemBackground
        setPropertyAttributes()
        setStackViews()
        setConstraints()
    }
    
    private func setPropertyAttributes() {
        [likeIconImageView, commentIconImageView].forEach {
            $0.contentMode = .scaleAspectFit
        }
        
        likeIconImageView.image = UIImage(named: "heart")
        commentIconImageView.image = UIImage(named: "chat")
        
        [likeNumberLabel, commentNumberLabel].forEach {
            $0.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 11)
            $0.textColor = .vegeTextBlack
        }
    }
    
    private func setStackViews() {
        [likeStackView, commentStackView].forEach {
            $0.alignment = .leading
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = -2
        }
        
        [commentInfoStackView].forEach {
            $0.alignment = .leading
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 0
        }
    }
    
    private func setConstraints() {
        [imageView, missionTypeLabel, mainTitleLabel, dateLabel, commentInfoStackView].forEach {
            addSubview($0)
        }
        
        imageView.backgroundColor = .red
        missionTypeLabel.text = "주간"
        mainTitleLabel.text = "자전거 출퇴근"
        dateLabel.text = "2020.07.13 - 07.29"
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.55)
        }
        
        mainTitleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(5)
        }

        missionTypeLabel.snp.makeConstraints {
            $0.leading.equalTo(mainTitleLabel)
            $0.bottom.equalTo(dateLabel.snp.top).offset(-2)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(missionTypeLabel)
            $0.bottom.equalTo(commentInfoStackView.snp.top).offset(-10)
        }
        commentInfoStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(self.frame.width / 1.5)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    
    // MARK: - Helpers
    func configureData(image: String, title: String, missionType: String, date: String, likes: String, comments: String) {
        imageView.image = UIImage(named: image)
        missionTypeLabel.text = missionType
        mainTitleLabel.text = title
        dateLabel.text = date
        likeNumberLabel.text = likes
        commentNumberLabel.text = comments
    }
}
