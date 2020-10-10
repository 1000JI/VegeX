//
//  ShoppingTableHeaderView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ShoppingTableHeaderView: UIView {
    
    // MARK: - Properties
    
    var headerType: ShoppingHelpType? {
        didSet { configure() }
    }
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "주문/배송조회"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private let totalViewLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 〉"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
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
        let lineView = UIView()
        lineView.backgroundColor = .vegeTextBlack
        addSubview(lineView)
        lineView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-1)
            $0.height.equalTo(1)
        }
        
        addSubview(headerTitleLabel)
        headerTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-12)
        }
        
        addSubview(totalViewLabel)
        totalViewLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-4)
        }
    }
    
    func configure() {
        guard let headerType = headerType else { return }
        headerTitleLabel.text = headerType.titleText
        
        switch headerType {
        case .order: fallthrough
        case .cancel: totalViewLabel.isHidden = false
        case .active: fallthrough
        case .helpers: totalViewLabel.isHidden = true
        }
    }
}
