//
//  ReviewCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ReviewCustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ReviewCustomCell"
    
    private let customView = UIView()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "kimhui**"
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
    
    private let buyOptionLabel: UILabel = {
        let label = UILabel()
        label.text = "구매옵션 : 15ml"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 10)
        label.textAlignment = .left
        label.textColor = .vegeIntroTextColor
        return label
    }()
    
    private let reviewTextLabel: UILabel = {
        let label = UILabel()
        label.text = "요즘 면역력이 떨어졌는지 급 피부가 뒤집어져서 트러블에 좋다는 제가 사보기로 했습니다. 그런데 효과가 정말 대단했어요."
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
        
        let gradeStack = UIStackView()
        gradeStack.axis = .horizontal
        gradeStack.distribution = .fillEqually
        gradeStack.spacing = 4
        
        for _ in 0..<Int(5) {
            let gradeImageView = UIImageView(image: UIImage(named: "gradeStar"))
            gradeImageView.snp.makeConstraints {
                $0.height.width.equalTo(8)
            }
            gradeStack.addArrangedSubview(gradeImageView)
        }
        
        let gradeTotalStack = UIStackView(arrangedSubviews: [gradeStack, idLabel])
        gradeTotalStack.spacing = 8
        gradeTotalStack.axis = .horizontal
        gradeTotalStack.distribution = .fillProportionally
        
        customView.addSubview(gradeTotalStack)
        gradeTotalStack.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        customView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }
        
        customView.addSubview(buyOptionLabel)
        buyOptionLabel.snp.makeConstraints {
            $0.top.equalTo(gradeTotalStack.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
        }
        
        customView.addSubview(reviewTextLabel)
        reviewTextLabel.snp.makeConstraints {
            $0.top.equalTo(buyOptionLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
