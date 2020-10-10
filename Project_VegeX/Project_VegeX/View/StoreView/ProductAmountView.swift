//
//  ProductAmountView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ProductAmountView: UIView {
    
    // MARK: - Properties
    
    private let capacityLabel: UILabel = {
        let label = UILabel()
        label.text = "15ml"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("﹣", for: .normal)
        button.setTitleColor(.vegeTextBlack, for: .normal)
        button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 24)
        button.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        return button
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.vegeTextBlack, for: .normal)
        button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 24)
        button.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        return button
    }()

    private let amountPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "24,000원"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        label.textAlignment = .center
        label.textColor = .vegeTextBlack
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [self, minusButton, numberLabel, plusButton].forEach {
            $0.layer.borderColor = UIColor.vegeAmountBorderColor.cgColor
            $0.layer.borderWidth = 1.0
        }
        
        addSubview(capacityLabel)
        capacityLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
        }
        
        let stack = UIStackView(arrangedSubviews: [minusButton, numberLabel, plusButton])
        stack.axis = .horizontal
        
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.width.equalTo(118)
        }
        
        addSubview(amountPriceLabel)
        amountPriceLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    
}
