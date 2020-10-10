//
//  HomeViewModel.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/15.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

enum ChallengeType: Int, CaseIterable {
    case processing
    case popular
    
    var description: String {
        switch self {
        case .processing: return "진행중"
        case .popular: return "인기"
        }
    }
}

enum TutorialStatus {
    case start
    case ongoing
    case finish
}
