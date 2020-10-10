//
//  ProductDetailViewModel.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

enum ProductInfoType: Int, CaseIterable {
    case guide
    case code
    case charge
    case information
    
    var description: String {
        switch self {
        case .guide: return "쇼핑가이드"
        case .code: return "상품코드"
        case .charge: return "배송비"
        case .information: return "배송정보"
        }
    }
}

enum ProductFooterViewType {
    case review
    case qna
    case guide
}
