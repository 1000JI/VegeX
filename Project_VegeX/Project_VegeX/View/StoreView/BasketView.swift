//
//  BasketView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class BasketView: UIView {
    
    // MARK: - Properties
    
    private let basketCountLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.text = "2"
        label.textAlignment = .center
        label.textColor = .white
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 12)
        label.snp.makeConstraints {
            $0.height.width.equalTo(18)
        }
        label.layer.cornerRadius = 18 / 2
        label.clipsToBounds = true
        label.backgroundColor = .vegeGreen
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
        let basketImageView = UIImageView(image: UIImage(named: "basket"))
        basketImageView.tintColor = .black
        
        addSubview(basketImageView)
        basketImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addSubview(basketCountLabel)
        basketCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-4)
        }
    }
}
