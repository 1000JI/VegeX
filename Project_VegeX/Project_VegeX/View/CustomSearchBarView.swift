//
//  CustomSearchBarView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class CustomSearchBarView: UIView {
    
    // MARK: - Properties
    let searchBar = CustomSearchBarTextField()
    
    
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
        layer.cornerRadius = 25
        setConstraints()
    }
    
    private func setConstraints() {
        addSubview(searchBar)
        searchBar.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
}
