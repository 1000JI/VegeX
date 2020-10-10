//
//  FilterView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/16.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class FilterSelectorView: UIView {
    
    // MARK: - Properties
    
    private let filterNameLabel: UILabel = {
        let label = UILabel()
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 11)
        label.textColor = .vegeTextBlack
        label.text = "상세필터"
        return label
    }()
    
    private let filterImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "filter"))
        iv.snp.makeConstraints {
            $0.height.width.equalTo(14)
        }
        return iv
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        layer.borderColor = UIColor.vegeFilterBorderGrayColor.cgColor
        layer.borderWidth = 1
        backgroundColor = .white
        
        addSubview(filterNameLabel)
        filterNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(20)
        }
        
        addSubview(filterImageView)
        filterImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
}
