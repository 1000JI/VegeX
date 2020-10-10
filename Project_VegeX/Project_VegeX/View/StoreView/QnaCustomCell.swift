//
//  QnaCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class QnaCustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "QnaCustomCell"
    
    private let customView = UIView()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "jiwoon**"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 10)
        label.textAlignment = .left
        label.textColor = .vegeIntroTextColor
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020.07.19"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 10)
        label.textAlignment = .right
        label.textColor = .vegeIntroTextColor
        return label
    }()
    
    private let qnaOptionLabel: UILabel = {
        let label = UILabel()
        label.text = "[상품문의]"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 10)
        label.textAlignment = .left
        label.textColor = .vegeIntroTextColor
        return label
    }()
    
    private let qnaTextLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀글입니다."
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 10)
        label.textAlignment = .left
        label.textColor = .vegeTextBlack
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        addSubview(customView)
        customView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        customView.addSubview(idLabel)
        idLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        customView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }
        
        customView.addSubview(qnaOptionLabel)
        qnaOptionLabel.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        customView.addSubview(qnaTextLabel)
        qnaTextLabel.snp.makeConstraints {
            $0.top.equalTo(qnaOptionLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
