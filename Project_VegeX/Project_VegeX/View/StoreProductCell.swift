//
//  StoreProductCell.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreProductCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "StoreProductCell"
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let productView1 = StoreHomeSellingProductView()
    let productView2 = StoreHomeSellingProductView()
    
    
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
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 24)
        titleLabel.numberOfLines = 0
        
        descriptionLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
        descriptionLabel.numberOfLines = 0
    }
    
    private func setConstraints() {
        [imageView, titleLabel, descriptionLabel, productView1, productView2].forEach {
            addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(370)
        }
        titleLabel.text = "Title"
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        descriptionLabel.text = "Description"
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
        }
        productView1.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        productView2.snp.makeConstraints {
            $0.top.equalTo(productView1.snp.bottom).offset(-1)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
    
    
    // MARK: - Helpers
    func configureCell(
        mainImage: UIImage, mainTitle: String, mainDescription: String,
        product1Image: UIImage, product1Title: String, product1Description: String, product1Price: String,
        product2Image: UIImage, product2Title: String, product2Description: String, product2Price: String) {
        
        imageView.image = mainImage
        titleLabel.attributedText = applyAttributesInTextForTitle(text: mainTitle)
        descriptionLabel.attributedText = applyAttributesInTextForDescription(text: mainDescription)
        
        productView1.imageView.image = product1Image
        productView1.productTitle.text = product1Title
        productView1.productDescription.text = product1Description
        productView1.productPrice.text = product1Price
        
        productView2.imageView.image = product2Image
        productView2.productTitle.text = product2Title
        productView2.productDescription.text = product2Description
        productView2.productPrice.text = product2Price
    }
    
    private func applyAttributesInTextForTitle(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        let _ = [ NSAttributedString.Key.font: VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 24) ]
        return attributedString
    }
    
    private func applyAttributesInTextForDescription(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        let _ = [ NSAttributedString.Key.font: VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16) ]
        return attributedString
    }
}
