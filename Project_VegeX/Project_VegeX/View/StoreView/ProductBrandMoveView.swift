//
//  ProductBrandMoveView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ProductBrandMoveView: UIView {
    
    // MARK: - Properties
    
    private let brandImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "brand_hersteller"))
        iv.contentMode = .scaleToFill
        iv.snp.makeConstraints {
            $0.width.height.equalTo(68)
        }
        return iv
    }()
    
    private let brandEnglishNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hersteller"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let brandKoreanNameLabel: UILabel = {
        let label = UILabel()
        label.text = "허스텔러"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textColor = .vegeTextBlack
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderColor = UIColor.vegeAmountBorderColor.cgColor
        layer.borderWidth = 1.0
        
        addSubview(brandImageView)
        brandImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        
        let stack = UIStackView(arrangedSubviews: [brandEnglishNameLabel, brandKoreanNameLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillProportionally
        
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.leading.equalTo(brandImageView.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
        
        let allowImageView = UIImageView(image: UIImage(named: "right-allow"))
        
        addSubview(allowImageView)
        allowImageView.snp.makeConstraints {
            $0.width.height.equalTo(18)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    
}
