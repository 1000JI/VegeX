//
//  ProductCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/16.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ProductCustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifer = "ProductCustomCell"
    
    var brandProduct: BrandProduct? {
        didSet { configure() }
    }
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "secretgardenpaletteflowerbed"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "SECRET GARDEN PALETTE FLOWER BED"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "52,000"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        label.textAlignment = .left
        label.textColor = .vegeGreen
        return label
    }()
    
    private let productServiceLabel: UILabel = {
        let label = UILabel()
        label.text = "무료배송"
        label.layer.borderColor = UIColor.vegeFilterBorderGrayColor.cgColor
        label.layer.borderWidth = 1
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 9)
        label.textAlignment = .center
        label.textColor = .vegeServiceLightGray
        return label
    }()
    
    private let heartImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "heart"))
        return iv
    }()
    
    private let heartLabel: UILabel = {
        let label = UILabel()
        label.text = "92"
        label.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 11)
        label.textAlignment = .left
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let commentImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "comment"))
        return iv
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 11)
        label.textAlignment = .left
        label.textColor = .vegeTextBlack
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
        
        whiteView.addSubview(productTitleLabel)
        productTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        whiteView.addSubview(productPriceLabel)
        productPriceLabel.snp.makeConstraints {
            $0.top.equalTo(productTitleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(8)
        }
        
        whiteView.addSubview(productServiceLabel)
        productServiceLabel.snp.makeConstraints {
            $0.top.equalTo(productPriceLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(48)
            $0.height.equalTo(20)
        }
        
        
        let heartStack = makeStackView(arrangedSubviews: [heartImageView, heartLabel])
        let commentStack = makeStackView(arrangedSubviews: [commentImageView, commentLabel])
        
        whiteView.addSubview(heartStack)
        heartStack.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
        }
        
        whiteView.addSubview(commentStack)
        commentStack.snp.makeConstraints {
            $0.leading.equalTo(heartStack.snp.trailing).offset(28)
            $0.centerY.equalTo(heartStack.snp.centerY)
        }
    }
    
    func makeStackView(arrangedSubviews views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .fillProportionally
        return stack
    }
    
    func configure() {
        guard let brandProduct = brandProduct else { return }
        productImageView.image = UIImage(named: brandProduct.imageName)
        productPriceLabel.text = brandProduct.price
        heartLabel.text = "\(brandProduct.heartCount)"
        commentLabel.text = "\(brandProduct.commentCount)"
    }
}
