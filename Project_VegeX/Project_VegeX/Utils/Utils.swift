//
//  Utils.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/15.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

enum VegeXFont {
    case AppleSDGothicNeo_Bold
    case AppleSDGothicNeo_UltraLight
    case AppleSDGothicNeo_Thin
    case AppleSDGothicNeo_Regular
    case AppleSDGothicNeo_Light
    case AppleSDGothicNeo_Medium
    case AppleSDGothicNeo_SemiBold
    
    func fontData(fontSize: CGFloat) -> UIFont {
        switch self {
        case .AppleSDGothicNeo_Bold:
            return UIFont(name: "AppleSDGothicNeo-Bold",
                                                   size: fontSize)!
        case .AppleSDGothicNeo_UltraLight:
            return UIFont(name: "AppleSDGothicNeo-UltraLight",
                                                   size: fontSize)!
        case .AppleSDGothicNeo_Thin:
            return UIFont(name: "AppleSDGothicNeo-Thin",
                                                   size: fontSize)!
        case .AppleSDGothicNeo_Regular:
            return UIFont(name: "AppleSDGothicNeo-Regular",
                                                   size: fontSize)!
        case .AppleSDGothicNeo_Light:
            return UIFont(name: "AppleSDGothicNeo-Light",
                                                   size: fontSize)!
        case .AppleSDGothicNeo_Medium:
            return UIFont(name: "AppleSDGothicNeo-Medium",
                                                   size: fontSize)!
        case .AppleSDGothicNeo_SemiBold:
            return UIFont(name: "AppleSDGothicNeo-SemiBold",
                                                   size: fontSize)!
        }
    }
}
