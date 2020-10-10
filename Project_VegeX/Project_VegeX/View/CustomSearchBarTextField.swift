//
//  CustomSearchBar.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class CustomSearchBarTextField: UITextField {
    
    // MARK: - Properties
    let magnifierIcon = UIImageView()
    
    
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
        placeholder = "검색어를 입력해주세요"
        
        magnifierIcon.image = UIImage(systemName: "magnifyingglass")
        magnifierIcon.tintColor = UIColor(rgb: 0xA3A3A3)
        setConstraints()
    }
    
    private func setConstraints() {
        [magnifierIcon].forEach {
            addSubview($0)
        }
        
        magnifierIcon.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
