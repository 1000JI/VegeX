//
//  StoreMainCategoryView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreMainCategoryView: UIView {
    
    // MARK: - Properties
    let buttons = ["NEW", "BEST", "식품", "건강기능식품", "패션", "뷰티"]
    let firstLineStackView = UIStackView()
    let secondLineStackView = UIStackView()
    lazy var stackViews = [firstLineStackView, secondLineStackView]
    
    let categoryStackView = UIStackView()
    let horizontalButtonCounter = 3
    
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
        backgroundColor = UIColor(rgb: 0xF1F2F4)
        generateButtons()
        setStackViews()
        setConstraints()
    }
    
    private func setStackViews() {
        stackViews.forEach {
            categoryStackView.addArrangedSubview($0)
            $0.alignment = .center
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 5
        }
        categoryStackView.alignment = .center
        categoryStackView.axis = .vertical
        categoryStackView.distribution = .fillEqually
        categoryStackView.spacing = 5
    }
    
    private func setConstraints() {
        addSubview(categoryStackView)
        categoryStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func generateButtons() {
        var counter = 0
        var stackViewCounter = 0
        for index in buttons.indices {
            let button = UIButton()
            button.setTitle(buttons[index], for: .normal)
            button.setTitleColor(.vegeTextBlack, for: .normal)
            button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
            button.contentHorizontalAlignment = .left
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            button.backgroundColor = .white
            button.snp.makeConstraints {
                $0.width.equalTo(102)
                $0.height.equalTo(40)
            }
            stackViews[stackViewCounter].addArrangedSubview(button)
            counter += 1
            if counter == horizontalButtonCounter {
                stackViewCounter += 1
                counter = 0
            }
        }
    }
}

