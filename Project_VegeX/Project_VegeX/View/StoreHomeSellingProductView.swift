//
//  StoreHomeSellingProductView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreHomeSellingProductView: UIView {
    
    // MARK: - Properties
    let imageView = UIImageView()
    let productTitle = UILabel()
    let productDescription = UILabel()
    let productPrice = UILabel()
    private let cartStackView = UIStackView()
    private let cartImageView = UIImageView()
    private let cartNameLabel = UILabel()
    private let divider1 = UIView()
    private let divider2 = UIView()
    
    
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
        setStackView()
        setConstraints()
    }
    
    private func setPropertyAttributes() {
        imageView.contentMode = .scaleAspectFit
        
        productTitle.text = "Title"
        productTitle.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 12)
        productTitle.textColor = .vegeTextBlack
        
        productDescription.text = "Description"
        productDescription.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        productDescription.textColor = .vegeTextBlack

        productPrice.text = "Price"
        productPrice.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        productPrice.textColor = .vegeGreen

        cartImageView.image = UIImage(named: "StoreHome_EmptyBag")
        cartImageView.contentMode = .scaleAspectFit
        
        cartNameLabel.text = "장바구니"
        cartNameLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 9)
        
        [divider1, divider2].forEach {
            $0.backgroundColor = UIColor(rgb: 0xDADCE0)
        }
    }
    
    private func setStackView() {
        [cartImageView, cartNameLabel].forEach {
            cartStackView.addArrangedSubview($0)
        }
        cartStackView.alignment = .center
        cartStackView.axis = .vertical
        cartStackView.distribution = .fillEqually
        cartStackView.spacing = -5
    }
    
    private func setConstraints() {
        [imageView, productTitle, productDescription, productPrice, cartStackView, divider1, divider2].forEach {
            addSubview($0)
        }
        
        imageView.backgroundColor = .black
        imageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview()
            $0.width.equalTo(60)
        }
        productTitle.snp.makeConstraints {
            $0.top.equalTo(imageView).inset(5)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        productDescription.snp.makeConstraints {
            $0.top.equalTo(productTitle.snp.bottom).offset(1)
            $0.leading.equalTo(productTitle)
        }
        productPrice.snp.makeConstraints {
            $0.leading.equalTo(productDescription)
            $0.bottom.equalTo(imageView)
        }
        cartStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.centerY.equalToSuperview()
        }
        divider1.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(1)
        }
        divider2.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(1)
        }
    }
}
