//
//  DetailCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/16.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class DetailCustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var brandProduct: BrandProduct? {
        didSet { configure() }
    }
    
    static let identifier = "DetailCustomCell"
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "storeexample1")
        iv.backgroundColor = .vegeGreen
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "위클리 베스트"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 12)
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
        addSubview(productImageView)
        productImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let whiteBackView = UIView()
        whiteBackView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        addSubview(whiteBackView)
        
        whiteBackView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(32)
        }
        
        whiteBackView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(8)
            $0.trailing.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func configure() {
        guard let brandProduct = brandProduct else { return }
        productImageView.image = UIImage(named: brandProduct.imageName)
        titleLabel.text = brandProduct.productName
    }
}
