//
//  extension.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    // 텍스트에 사용되는 검정색
    static let vegeTextBlack = UIColor(rgb: 0x303033)
    // 튜토리얼 상단에 사용되는 텍스트 연한 회색
    static let vegeIntroTextColor = UIColor(rgb: 0x6D6D72)
    // 컨셉컬러 그린
    static let vegeGreen = UIColor(rgb: 0x156941)
    // 옅은 그린 색상
    static let vegeLightGreen = UIColor(rgb: 0x71A08A)
    // 옅은 회색 배경
    static let vegeGrayBackground = UIColor(rgb: 0xf1f2f4)
    // 테이블 뷰 옅은 회색
    static let vegeTableViewBackgroundColor = UIColor(rgb: 0xF7F7F7)
    // 필터 버튼 테두리 옅은 회색
    static let vegeFilterBorderGrayColor = UIColor(rgb: 0xE4E4E4)
    // 서비스(무료배송) 글자 회색
    static let vegeServiceLightGray = UIColor(rgb: 0x5D5D5D)
    // 제품 수량 개수 테두리색(회색)
    static let vegeAmountBorderColor = UIColor(rgb: 0xDADCE0)
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
