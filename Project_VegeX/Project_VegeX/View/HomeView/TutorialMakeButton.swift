//
//  TutorialMakeButton.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

enum TutorialButtonType {
    case green
    case white
}

class TutorialMakeButton: UIButton {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(type: UIButton.ButtonType, buttonType: TutorialButtonType, text: String) {
        self.init(type: type)
        
        setTitle(text, for: .normal)
        switch buttonType {
        case .green:
            setTitleColor(.white, for: .normal)
            backgroundColor = .vegeLightGreen
            titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        case .white:
            setTitleColor(.vegeGreen, for: .normal)
            backgroundColor = .white
            layer.borderColor = UIColor.vegeGreen.cgColor
            layer.borderWidth = 1.0
            titleLabel?.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 18)
        }
        snp.makeConstraints {
            $0.width.equalTo(288)
            $0.height.equalTo(56)
        }
        layer.cornerRadius = 56 / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    
}
