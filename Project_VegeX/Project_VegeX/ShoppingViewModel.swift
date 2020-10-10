//
//  ShoppingViewModel.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

enum ShoppingHelpType: Int, CaseIterable {
    case order
    case cancel
    case active
    case helpers
    
    var rowCount: Int {
        switch self {
        case .order: return 1
        case .cancel: return 1
        case .active: return 6
        case .helpers: return 3
        }
    }
    
    var titleText: String {
        switch self {
        case .order: return "주문/배송조회"
        case .cancel: return "취소/교환/환불 내역"
        case .active: return "나의 쇼핑 활동"
        case .helpers: return "고객센터"
        }
    }
}

struct ShoppingCategoryData {
    static let orderCategory = ["입금/결제", "배송중", "배송완료", "구매확정"]
    static let cancelCategory = ["교환", "교환완료", "환불", "환불완료"]
    static let activeCategory = ["장바구니", "주문/배송조회", "취소/교환/환불 내역", "구매후기", "상품문의", "1:1문의"]
    static let helpersCategory = ["공지사항", "FAQ", "회원혜택"]
}
