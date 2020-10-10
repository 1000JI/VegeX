//
//  BeautyCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class BeautyCustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifer = "BeautyCustomCell"
    
    var brandProduct: BrandProduct? {
        didSet { configure() }
    }
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "lipparadisesheep"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let brandNameLabel: UILabel = {
        let label = UILabel()
        label.text = "디어달리아"
        label.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 12)
        label.textAlignment = .left
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "LIP PARADISE SHEER DEW TINTED LIPSTICK"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "28,000"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        label.textAlignment = .left
        label.textColor = .vegeGreen
        return label
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
        clipsToBounds = true
        
        layer.borderColor = UIColor.vegeAmountBorderColor.cgColor
        layer.borderWidth = 1.0
        
        addSubview(productImageView)
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(166)
        }
        
        
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        
        addSubview(whiteView)
        whiteView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        whiteView.addSubview(brandNameLabel)
        brandNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        whiteView.addSubview(productNameLabel)
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(brandNameLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        whiteView.addSubview(productPriceLabel)
        productPriceLabel.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
        }
    }
    
    func configure() {
        guard let brandProduct = brandProduct else { return }
        productImageView.image = UIImage(named: brandProduct.imageName)
        productNameLabel.text = brandProduct.productName
        productPriceLabel.text = brandProduct.price
    }
}
