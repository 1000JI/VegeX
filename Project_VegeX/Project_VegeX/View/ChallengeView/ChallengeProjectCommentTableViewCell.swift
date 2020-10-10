//
//  CommentTableViewCell.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/18/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeProjectCommentTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "ChallengeProjectCommentTableViewCell"
    
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let commentLabel = UILabel()
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        [nameLabel, commentLabel].forEach {
            $0.textColor = .vegeTextBlack
            $0.numberOfLines = 0
        }
        
        profileImageView.layer.cornerRadius = 25
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.backgroundColor = .lightGray
        
        nameLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 15)
        dateLabel.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 11)
        dateLabel.textColor = UIColor(rgb: 0x777777)
        commentLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
    }
    
    private func setConstraints() {
        [profileImageView, nameLabel, dateLabel, commentLabel].forEach {
            addSubview($0)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalTo(nameLabel)
        }
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.leading.equalTo(nameLabel)
        }
    }
    
}
