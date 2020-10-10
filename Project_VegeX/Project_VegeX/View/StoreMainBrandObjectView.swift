//
//  StoreMainBrandObjectView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreMainBrandObjectView: UIView {
    
    // MARK: - Properties
    let imageBorderView = UIView()
    let imageView = UIImageView()
    let brandTitle = UILabel()
    
    
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
        setPropertyAttributes()
        setConstraints()
    }
    
    private func setPropertyAttributes() {
        brandTitle.textColor = .vegeTextBlack
        brandTitle.textAlignment = .center
        brandTitle.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 13)
                
        imageBorderView.layer.borderWidth = 1
        imageBorderView.layer.borderColor = UIColor(rgb: 0xF1F2F4).cgColor
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    
    private func setConstraints() {
        [imageBorderView, brandTitle].forEach {
            addSubview($0)
        }
        imageBorderView.addSubview(imageView)
        
        imageBorderView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(75)
        }
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        brandTitle.snp.makeConstraints {
            $0.top.equalTo(imageBorderView.snp.bottom).offset(3)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
