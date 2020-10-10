//
//  TutorialListupCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/16.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class TutorialListupCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "TutorialListupCell"
    
    var tutorial: Tutorial? {
        didSet { configure() }
    }
    
    private let listupImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "listup"))
        return iv
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "01"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 20)
        label.textAlignment = .center
        label.textColor = .vegeGreen
        return label
    }()
    
    private let missionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 16)
        label.textAlignment = .left
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let missionSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "SubTitle"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textAlignment = .left
        label.textColor = .vegeGreen
        return label
    }()
    
    private let checkStatusImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "checkcircle"))
        iv.snp.makeConstraints {
            $0.height.width.equalTo(44)
        }
        return iv
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
        addSubview(listupImageView)
        listupImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        let dayTitleLabel = UILabel()
        dayTitleLabel.text = "DAY"
        dayTitleLabel.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 12)
        dayTitleLabel.textAlignment = .center
        dayTitleLabel.textColor = .vegeGreen
        
        let dayStack = UIStackView(arrangedSubviews: [dayTitleLabel, dayLabel])
        dayStack.axis = .vertical
        dayStack.spacing = 4
        dayStack.distribution = .fillProportionally
        
        addSubview(dayStack)
        dayStack.snp.makeConstraints {
            $0.leading.equalTo(listupImageView.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        let lineView = UIView()
        lineView.backgroundColor = .vegeGreen
        
        addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.width.equalTo(0.5)
            $0.height.equalTo(32)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(dayStack.snp.trailing).offset(14)
        }
        
        let missionStack = UIStackView(arrangedSubviews: [missionTitleLabel, missionSubTitleLabel])
        missionStack.axis = .vertical
        missionStack.spacing = 4
        missionStack.distribution = .fillProportionally
        
        addSubview(missionStack)
        missionStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(lineView.snp.trailing).offset(14)
        }
        
        addSubview(checkStatusImageView)
        checkStatusImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configure() {
        guard let tutorial = tutorial else { return }
        let viewModel = TutorialViewModel(tutorial: tutorial)
        dayLabel.text = viewModel.formatterDayText
        missionTitleLabel.text = tutorial.title
        missionSubTitleLabel.text = viewModel.missionText
        checkStatusImageView.image = viewModel.checkImage
    }
}
