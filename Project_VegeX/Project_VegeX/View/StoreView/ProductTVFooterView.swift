//
//  ProductTVFooterView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ProductTVFooterView: UIView {
    
    // MARK: - Properties
    
    var type: ProductFooterViewType?
    
    var setLabelText: String {
        guard let type = type else { return "" }
        switch type {
        case .review: return "리뷰 전체보기 (45)"
        case .qna: return "Q&A 전체보기 (5)"
        case .guide: return "배송정보, 교환/환불안내"
        }
    }
    
    private lazy var footerTitleLabel: UILabel = {
        guard let type = type else { return UILabel() }
        
        let label = UILabel()
        label.textColor = .vegeTextBlack
        return label
    }()
    
    // MARK: - LifeCycle
    
    convenience init(type: ProductFooterViewType) {
        self.init()
        self.type = type
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        layer.borderColor = UIColor.vegeAmountBorderColor.cgColor
        layer.borderWidth = 1.0
        
        addSubview(footerTitleLabel)
        footerTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
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
    
    func configure() {
        guard let type = type else { return }
        footerTitleLabel.text = setLabelText
        
        if type == .guide {
            footerTitleLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        } else {
            footerTitleLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        }
    }
}
