//
//  ShoppingStatusView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

enum ShoppingType {
    case saveMoney
    case point
    case coupon
    
    var imageName: String {
        switch self {
        case .saveMoney: return "shopping_savemoney"
        case .point: return "shopping_point"
        case .coupon: return "shopping_coupon"
        }
    }
}

class ShoppingStatusView: UIView {
    
    // MARK: - Properties
    
    private var saveMoneyLabel: UILabel!
    private var pointLabel: UILabel!
    private var couponLabel: UILabel!
    
    private var saveMoneyImageView: UIImageView!
    private var pointImageView: UIImageView!
    private var couponImageView: UIImageView!
    
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
        layer.cornerRadius = 5
        layer.borderColor = UIColor.vegeAmountBorderColor.cgColor
        layer.borderWidth = 1.0
        
        saveMoneyLabel = makeLabelConfigure()
        pointLabel = makeLabelConfigure()
        couponLabel = makeLabelConfigure()
        
        saveMoneyImageView = makeImageViewConfigure(type: .saveMoney)
        pointImageView = makeImageViewConfigure(type: .point)
        couponImageView = makeImageViewConfigure(type: .coupon)
        
        let amountStack = UIStackView(arrangedSubviews: [
            makeStackView(image: saveMoneyImageView, with: saveMoneyLabel, string: "적립금"),
            makeStackView(image: pointImageView, with: pointLabel, string: "포인트"),
            makeStackView(image: couponImageView, with: couponLabel, string: "쿠폰")])
        saveMoneyLabel.text = "4,446"
        pointLabel.text = "5,000"
        couponLabel.text = "2"
        amountStack.axis = .horizontal
        amountStack.alignment = .center
        amountStack.distribution = .equalSpacing
        
        addSubview(amountStack)
        amountStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func makeImageViewConfigure(type: ShoppingType) -> UIImageView {
        let iv = UIImageView(image: UIImage(named: "shopping_coupon"))
        iv.image = UIImage(named: type.imageName)
        return iv
    }
    
    func makeLabelConfigure() -> UILabel {
        let toLabel = UILabel()
        toLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 12)
        toLabel.textColor = .vegeTextBlack
        toLabel.text = "123"
        toLabel.textAlignment = .center
        return toLabel
    }

    func makeStackView(image: UIImageView, with label: UILabel, string: String) -> UIStackView {
        let topLabel = UILabel()
        topLabel.text = string
        topLabel.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 12)
        topLabel.textColor = .vegeTextBlack
        topLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [image, topLabel, label])
        stack.axis = .vertical
//        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 4
        stack.snp.makeConstraints {
            $0.width.equalTo(120)
        }
        return stack
    }
    
    func makeLineView() -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = .vegeAmountBorderColor
        lineView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(10)
        }
        return lineView
    }
}
