//
//  ChallengeStatusBarView.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeStatusBarView: UIView {
    
    // MARK: - Properties
    
    private var attentionLabel: UILabel!
    private var completeLabel: UILabel!
    private var pointLabel: UILabel!
    
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
        
        attentionLabel = makeLabelConfigure()
        completeLabel = makeLabelConfigure()
        pointLabel = makeLabelConfigure()
        
        let lineView1 = makeLineView()
        let lineView2 = makeLineView()
        
        let amountStack = UIStackView(arrangedSubviews: [
            makeStackView(with: attentionLabel, string: "관심 챌린지"),
            lineView1,
            makeStackView(with: completeLabel, string: "진행 완료 챌린지"),
            lineView2,
            makeStackView(with: pointLabel, string: "포인트")])
        attentionLabel.text = "7"
        completeLabel.text = "10"
        pointLabel.text = "5000"
        amountStack.axis = .horizontal
        amountStack.alignment = .center
        amountStack.distribution = .equalSpacing
        
        addSubview(amountStack)
        amountStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func makeLabelConfigure() -> UILabel {
        let toLabel = UILabel()
        toLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        toLabel.textColor = .vegeGreen
        toLabel.text = "1234"
        toLabel.textAlignment = .center
        return toLabel
    }

    func makeStackView(with label: UILabel, string: String) -> UIStackView {
        let bottomLabel = UILabel()
        bottomLabel.text = string
        bottomLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 11)
        bottomLabel.textColor = .vegeTextBlack
        bottomLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [label, bottomLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.snp.makeConstraints {
            $0.width.equalTo(100)
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
